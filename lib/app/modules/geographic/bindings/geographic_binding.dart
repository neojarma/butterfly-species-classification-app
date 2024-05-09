import 'package:get/get.dart';

import '../controllers/geographic_controller.dart';

class GeographicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeographicController>(
      () => GeographicController(),
    );
  }
}
