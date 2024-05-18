import 'package:get/get.dart';

import '../controllers/detail_statistic_controller.dart';

class DetailStatisticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailStatisticController>(
      () => DetailStatisticController(),
    );
  }
}
