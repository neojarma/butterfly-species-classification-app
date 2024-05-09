import 'package:get/get.dart';

import '../controllers/butterfly_controller.dart';

class ButterflyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButterflyController>(
      () => ButterflyController(),
    );
  }
}
