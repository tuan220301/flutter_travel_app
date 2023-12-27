import 'package:get/get.dart';

class slashController extends GetxController {
  RxBool showSlashScreen = false.obs;

  void setloading(bool loading) {
    print('loading: $loading');
    showSlashScreen.value = loading;
  }
}
