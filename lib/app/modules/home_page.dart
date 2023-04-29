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
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, spreadRadius: 1, blurRadius: 2)
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
            )
          ],
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
