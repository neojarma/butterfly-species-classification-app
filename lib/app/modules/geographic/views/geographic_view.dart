import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/modules/geographic/widgets/geographic_drawer_filter.dart';
import 'package:butterfly_classification/app/modules/geographic/widgets/geographic_front_panel.dart';
import 'package:butterfly_classification/app/modules/geographic/widgets/geographic_map_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/geographic_controller.dart';

class GeographicView extends GetView<GeographicController> {
  const GeographicView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GeographicDrawerFilter(controller: controller),
      appBar: AppBar(
        title: Text(
          'Geographic View',
          style: headline6,
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Obx(
          () => SlidingUpPanel(
            maxHeight: Get.size.height * 0.6,
            minHeight: controller.isClicked.value ? 100 : 0,
            panel: GeographicFrontPanel(controller: controller),
            body: GeographicMapPanel(controller: controller),
          ),
        ),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}
