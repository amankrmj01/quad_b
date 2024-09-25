import 'package:get/get.dart';
import 'package:quad_b/presentation/home/controllers/home.controller.dart';

import '../../../../presentation/mainboard/controllers/mainboard.controller.dart';

class MainboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainboardController(),
    );
    Get.put(
      HomeController(),
    );
  }
}
