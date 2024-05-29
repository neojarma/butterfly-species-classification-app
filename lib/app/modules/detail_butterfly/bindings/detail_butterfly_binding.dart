import 'package:get/get.dart';

import '../controllers/detail_butterfly_controller.dart';

class DetailButterflyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailButterflyController>(
      () => DetailButterflyController(),
    );
  }
}
