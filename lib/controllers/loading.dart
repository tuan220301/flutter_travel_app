import 'package:get/get.dart';

class Loading extends GetxController {
  RxBool isLoading = false.obs;

  void setloading(bool loading) {
    print('loading: $loading');
    isLoading.value = loading;
  }
}
