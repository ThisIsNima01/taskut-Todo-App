import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedTimelineIndex = 0;

  void timelineChanged(int index) {
    selectedTimelineIndex = index;
    update();
  }
}
