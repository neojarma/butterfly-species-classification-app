import 'package:get/get.dart';

import '../controllers/observe_controller.dart';

class ObserveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ObserveController>(
      () => ObserveController(),
    );
  }
}
