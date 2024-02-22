import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:travel_app/constants/printCus.dart';

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  void setUser(User? data) {
    printDebug('data from user', data);
    user.value = data;
    // isLoading.value = loading;
  }
}
