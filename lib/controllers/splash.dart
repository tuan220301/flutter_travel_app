import 'package:get/get.dart';

class Loading extends GetxController {
  RxBool splashShow = false.obs;

  void setOpenSplashScreen(bool open) {
    splashShow.value = open;
  }
}
