import 'package:get/get.dart';
import 'package:travel_app/constants/data.dart';

class SetView360Controller extends GetxController {
  RxMap viewShow = listScrollButtonBottom[0].obs;

  void setView(viewObject) {
    // printDebug('view controller', viewObject);
    viewShow.value = viewObject;
  }
}

class TypeShow extends GetxController {
  RxBool isSlide = true.obs;

  void setScreen(bool show) {
    isSlide.value = show;
  }
}
