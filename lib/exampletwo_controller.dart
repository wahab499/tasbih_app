import 'package:get/get.dart';

class ExampletwoController extends GetxController {
  RxDouble opacity = .4.obs;
  setOpacity(double valuee) {
    opacity.value = valuee;
  }
}
