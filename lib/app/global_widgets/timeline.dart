import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../core/values/colors.dart';
import '../modules/home/home_controller.dart';

class Timeline extends StatelessWidget {
  Timeline({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 30),
        child: SizedBox(
          height: 50,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GetBuilder<HomeController>(
              builder: (controller) => ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 80,
                          height: 2,
                          decoration: const BoxDecoration(
                            color: CustomColors.lightGreen,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 700),
                          opacity:
                              controller.selectedTimelineIndex == index ? 1 : 0,
                          child: Container(
                            // width: controller.selectedTimelineIndex == index
                            //     ? 10
                            //     : 0,
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.primaryColor,
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
                        controller.timelineChanged(index);
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 700),
                        style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: controller.selectedTimelineIndex == index
                              ? CustomColors.blackColor
                              : CustomColors.greyColor,
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
