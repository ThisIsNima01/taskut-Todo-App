import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskut/app/core/values/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _getTopUserInfo(),
            _getSearchField(),
            const _getCategoryTitle(),
            const _getTaskCategoryList()
          ],
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
            boxShadow: [
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
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: CustomColors.greyColor,
                      fontFamily: 'SB',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '... جستجوی تسکات',
                      hintStyle: TextStyle(
                        color: CustomColors.greyColor,
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
                color: CustomColors.lightGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  '20 تسک فعال',
                  style: TextStyle(
                    color: CustomColors.primaryColor,
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
                        color: CustomColors.primaryColor,
                        fontSize: 16,
                        fontFamily: 'SB',
                      ),
                    ),
                    Text(
                      ' ، سلام',
                      style: TextStyle(
                        color: CustomColors.blackColor,
                        fontSize: 16,
                        fontFamily: 'SB',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                const Text(
                  'شهریور2',
                  style: TextStyle(
                    color: CustomColors.greyColor,
                    fontSize: 12,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
            SizedBox(
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
                color: CustomColors.primaryColor,
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
                            color: CustomColors.blackColor,
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
                color: CustomColors.primaryColor,
              ),
            ),
            Spacer(),
            Text(
              'دسته بندی',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: CustomColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
