import 'package:get/get.dart';
import 'package:taskut/app/modules/home_binding.dart';
import 'package:taskut/app/modules/home_page.dart';
import 'package:taskut/app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
