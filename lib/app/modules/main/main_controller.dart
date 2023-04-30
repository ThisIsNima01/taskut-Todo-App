import 'package:get/get.dart';

class MainController extends GetxController {
  var _isFabVisible = true;

  bool get isFabVisible => _isFabVisible;

  updateFabVisibility(bool visible) {
    _isFabVisible = visible;
    update();
  }
}
