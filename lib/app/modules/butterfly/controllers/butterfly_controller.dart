import 'package:butterfly_classification/app/data/model/butterflies/butterflies_response.dart';
import 'package:butterfly_classification/app/data/service/butterflies_response.dart';
import 'package:get/get.dart';

class ButterflyController extends GetxController with StateMixin {
  List<Butterfly> butterflies = [];

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    final resp = await ButterfliesService.butterflies();
    butterflies = resp.butterflies;
    change(true, status: RxStatus.success());

    super.onInit();
  }
}
