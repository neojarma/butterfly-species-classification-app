import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_statistic_controller.dart';

class DetailStatisticView extends GetView<DetailStatisticController> {
  const DetailStatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistic View'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  controller.pieObservations.species
                      .replaceAll('-', ' ')
                      .capitalize!,
                  style: buttonText,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.toggleFilter.value
                          ? 'Filter by Year Range'
                          : 'Filter by Year',
                      style: headline7,
                    ),
                    Switch(
                      activeTrackColor: darkBlue,
                      value: controller.toggleFilter.value,
                      onChanged: (value) {
                        controller.toggleFilter.value =
                            !controller.toggleFilter.value;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 10,
              ),
              Obx(
                () => Text(
                  controller.toggleFilter.value
                      ? 'Enter Year Range'
                      : 'Enter Year',
                  style: headline7,
                ),
              ),
              Obx(
                () => controller.toggleFilter.value
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'From : ',
                                  style: headline7,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 70,
                                  child: TextField(
                                    controller: controller.yearFromController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      counterText: '',
                                      contentPadding: EdgeInsets.zero,
                                      // Other decoration properties...
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: Text(
                                  'To : ',
                                  style: headline7,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 70,
                                  child: TextField(
                                    controller: controller.yearToController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      counterText: '',
                                      contentPadding: EdgeInsets.zero,
                                      // Other decoration properties...
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomButtonFillColor(
                            label: 'Apply',
                            onTap: controller.updateDataChartRange,
                            color: darkBlue,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: controller.yearController,
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: const InputDecoration(
                                counterText: '',
                                contentPadding: EdgeInsets.zero,
                                // Other decoration properties...
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: CustomButtonFillColor(
                              label: 'Apply',
                              onTap: controller.updateDataChart,
                              color: darkBlue,
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => Center(
                  child: Text(
                    'Data for ${controller.selectedYear.value}',
                    style: buttonText,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              controller.obx(
                (state) => controller.points.isNotEmpty
                    ? Center(
                        child: SizedBox(
                          height: Get.size.height * 0.4,
                          width: Get.size.width * 0.9,
                          child: LineChart(
                            LineChartData(
                              minY: controller.min - 10 < 0
                                  ? 0
                                  : controller.min - 10,
                              maxY: controller.max,
                              titlesData: FlTitlesData(
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      if (controller.toggleFilter.value) {
                                        if (controller.backup.contains(value)) {
                                          final DateFormat yearFormat =
                                              DateFormat.y();
                                          DateTime date =
                                              DateTime(value.toInt());
                                          String year = yearFormat.format(date);
                                          return Text(year);
                                        }
                                      } else {
                                        if (controller.backup.contains(value)) {
                                          final DateFormat monthFormat =
                                              DateFormat.MMM();
                                          int monthIndex = value.toInt();
                                          DateTime date =
                                              DateTime(0, monthIndex);
                                          String monthName =
                                              monthFormat.format(date);
                                          return Text(monthName);
                                        }
                                      }

                                      return const Text('');
                                    },
                                  ),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller.points
                                      .map(
                                          (point) => FlSpot(point[0], point[1]))
                                      .toList(),
                                  isCurved: false,
                                  dotData: const FlDotData(
                                    show: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Text(
                            'No Data',
                            style: headline6,
                          ),
                        ),
                      ),
                onLoading: const LoadingSpinkit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
