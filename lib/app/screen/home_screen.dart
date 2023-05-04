import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskut/app/bloc/task/task_bloc.dart';
import 'package:taskut/app/config/theme.dart';
import 'package:taskut/app/data/model/task/task.dart';
import 'package:taskut/app/core/global_state/fab_visibility_state.dart';
import 'package:taskut/app/widgets/task_widget.dart';
import 'package:taskut/app/widgets/timeline.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TaskBloc>().add(TaskListReceived());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            // if (taskBox.values.last == 0) return true;

            if (notification.metrics.axis == Axis.horizontal) {
              return false;
            }

            if (notification.direction == ScrollDirection.forward) {
              FabChanged(true).dispatch(context);
            } else if (notification.direction == ScrollDirection.reverse) {
              FabChanged(false).dispatch(context);
            }

            return true;
          },
          child: CustomScrollView(
            slivers: [
              _getTopUserInfo(),
              _getSearchField(),
              const _getCategoryTitle(),
              const _getTaskCategoryList(),
              const _getTodaysTasksTitle(),
              Timeline(),
              _getTasksList(),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getSearchField() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -20,
                offset: Offset(0, 4),
                color: Colors.black,
              )
            ],
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
                const Spacer(),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      context
                          .read<TaskBloc>()
                          .add(TaskSearched(value, value.length));
                    },
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontFamily: 'SB',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '... جستجوی تسکات',
                      hintStyle: TextStyle(
                        color: AppColors.greyColor,
                        fontFamily: 'SB',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getTopUserInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  '20 تسک فعال',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: 'SB',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      'نیما',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontFamily: 'SB',
                      ),
                    ),
                    Text(
                      ' ، سلام',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontFamily: 'SB',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'شهریور2',
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _getTasksList extends StatelessWidget {
  _getTasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<TaskBloc, TaskState>(
        buildWhen: (previous, current) {
          if (previous is TaskListReceiveSuccess &&
              current is TaskListReceiveSuccess) {
            return previous.taskList.length != current.taskList.length;
          }
          return true;
        },
        builder: (context, state) {
          if (state is TaskListReceiveSuccess) {
            return Card(
              elevation: 0,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      context
                          .read<TaskBloc>()
                          .add(TaskDeleted(state.taskList[index]));
                    },
                    key: UniqueKey(),
                    child: TaskWidget(
                      task: state.taskList[index],
                    ),
                  );
                },
                itemCount: state.taskList.length,
              ),
            );
          } else if (state is TaskSearch) {
            return Card(
              elevation: 0,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      context
                          .read<TaskBloc>()
                          .add(TaskDeleted(state.taskList[index]));
                    },
                    key: UniqueKey(),
                    child: TaskWidget(
                      task: state.taskList[index],
                    ),
                  );
                },
                itemCount: state.taskList.length,
              ),
            );
          }
          return Text('error');
        },
      ),
    ));
  }
}

class _getTodaysTasksTitle extends StatelessWidget {
  const _getTodaysTasksTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
          top: 32,
        ),
        child: Row(
          children: const [
            Text(
              'مشاهده بیشتر',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Text(
              'تسک های امروز',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _getTaskCategoryList extends StatelessWidget {
  const _getTaskCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 162,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(right: index == 0 ? 24 : 20),
              width: 130,
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/icons/cart.svg',
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'ورزش',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: 'SB',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _getCategoryTitle extends StatelessWidget {
  const _getCategoryTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        child: Row(
          children: const [
            Text(
              'مشاهده بیشتر',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Text(
              'دسته بندی',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
