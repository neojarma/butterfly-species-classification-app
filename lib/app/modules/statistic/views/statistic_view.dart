import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  const StatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistic View'),
        centerTitle: true,
      ),
      body: controller.obx(
        onLoading: const LoadingSpinkit(),
        (state) => SizedBox(
          height: Get.size.height,
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * 0.15,
              ),
              Text(
                'Total Butterflies Observations : ${controller.pieChartResponse.totalObservations}',
                style: smallText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Get.size.width / 2,
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              return;
                            }

                            var index = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                            if (index < 0) return;

                            final arg = controller
                                .pieChartResponse.pieObservations[index];
                            Get.toNamed(
                              Routes.DETAIL_STATISTIC,
                              arguments: arg,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: controller.sections,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.indicator,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Click on the chart to view detailed information',
                style: smallText.copyWith(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
