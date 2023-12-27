import 'package:get/get.dart';
import 'package:travel_app/constants/printCus.dart';

class SetView360Controller extends GetxController {
  RxString viewShow = ''.obs;

  void setView(String nameView) {
    printDebug('view controller', nameView);
    viewShow.value = nameView;
  }
}

class TypeShow extends GetxController {
  RxBool isSlide = true.obs;

  void setScreen(bool show) {
    isSlide.value = show;
  }
}
