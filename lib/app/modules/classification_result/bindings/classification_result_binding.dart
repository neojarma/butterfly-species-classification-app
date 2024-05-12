import 'package:get/get.dart';

import '../controllers/classification_result_controller.dart';

class ClassificationResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassificationResultController>(
      () => ClassificationResultController(),
    );
  }
}
