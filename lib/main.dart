import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskut/app/core/values/colors.dart';
import 'package:taskut/app/modules/home_binding.dart';
import 'package:taskut/app/modules/home_page.dart';
import 'package:taskut/app/routes/app_pages.dart';
import 'package:animate_icons/animate_icons.dart';

import 'package:taskut/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimateIconController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    controller = AnimateIconController();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskut',
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.home,
      builder: (context, child) => Stack(
        children: [
          child!,
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              backgroundColor: CustomColors.primaryColor,
              onPressed: () {},
              child: AnimateIcons(
                startIcon: Icons.add,
                endIcon: Icons.done,
                size: 40.0,

                controller: controller!,
                // add this tooltip for the start icon
                // startTooltip: 'Icons.add_circle',
                // add this tooltip for the end icon
                // endTooltip: 'Icons.add_circle_outline',
                onStartIconPress: () {
                  print("Clicked on Add Icon");
                  Get.toNamed('/detail');
                  return true;
                },
                onEndIconPress: () {
                  print("Clicked on Close Icon");
                  Get.back();

                  return true;
                },
                duration: Duration(milliseconds: 500),
                startIconColor: Colors.white,
                endIconColor: Colors.white,
                clockwise: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
