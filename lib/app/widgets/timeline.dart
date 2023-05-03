import 'package:flutter/material.dart';

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
                        width: 80,
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
                      child: Text(getTimelineTitles()[index]),
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.horizontal,
              itemCount: getTimelineTitles().length,
            ),
          ),
        ),
      ),
    );
  }

  List<String> getTimelineTitles() => [
        'همه',
        '10 - 8:30',
        '12 - 10',
        '13:30 - 12',
        '13:30 - 12',
        '13:30 - 12',
        '13:30 - 12',
      ];
}
