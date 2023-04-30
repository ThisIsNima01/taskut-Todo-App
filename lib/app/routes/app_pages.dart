import 'package:get/get.dart';
import 'package:taskut/app/modules/main/main_binding.dart';
import 'package:taskut/app/modules/main/main_page.dart';
import 'package:taskut/app/routes/app_routes.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
