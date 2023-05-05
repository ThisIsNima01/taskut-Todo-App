import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskut/app/bloc/task/task_bloc.dart';
import 'package:taskut/app/core/utils/timeline_times.dart';

import '../config/theme.dart';

class Timeline extends StatefulWidget {
  Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int _selectedTimelineIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 30),
        child: SizedBox(
          height: 50,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 82,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: AppColors.lightGreen,
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        opacity: _selectedTimelineIndex == index ? 1 : 0,
                        // opacity: 1,
                        child: Container(
                          width: _selectedTimelineIndex == index ? 10 : 0,
                          // width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkResponse(
                    onTap: () {
                      setState(() {
                        _selectedTimelineIndex = index;
                      });
                      if (index == 0) {
                        context
                            .read<TaskBloc>()
                            .add(TaskTimelineFilterChanged(0, 0));
                      } else {
                        context.read<TaskBloc>().add(TaskTimelineFilterChanged(
                            Utils.getTimelineTimes()[index][0],
                            Utils.getTimelineTimes()[index][1]));
                      }
                    },
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 700),
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 16,
                        color: _selectedTimelineIndex == index
                            ? AppColors.blackColor
                            : AppColors.greyColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(index == 0
                            ? Utils.getTimelineTimes()[index]
                            : '${Utils.getTimelineTimes()[index][1]} - ${Utils.getTimelineTimes()[index][0]}'),
                      ),
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.horizontal,
              itemCount: Utils.getTimelineTimes().length,
            ),
          ),
        ),
      ),
    );
  }
}
