import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/data/model/pie_charts/pie_chart_response.dart';
import 'package:butterfly_classification/app/data/service/pie_chart_response.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController with StateMixin {
  PieChartResponse pieChartResponse = PieChartResponse(
    pieObservations: [],
    totalObservations: 0,
  );
  List<PieChartSectionData> sections = [];
  final List<Color> pieChartColors = [
    const Color.fromRGBO(158, 1, 66, 1), // rgba(158, 1, 66, 1)
    const Color.fromRGBO(213, 62, 79, 1), // rgba(213, 62, 79, 1)
    const Color.fromRGBO(244, 109, 67, 1), // rgba(244, 109, 67, 1)
    const Color.fromRGBO(253, 174, 97, 1), // rgba(253, 174, 97, 1)
    const Color.fromRGBO(254, 224, 139, 1), // rgba(254, 224, 139, 1)
    const Color.fromRGBO(230, 245, 152, 1), // rgba(230, 245, 152, 1)
    const Color.fromRGBO(171, 221, 164, 1), // rgba(171, 221, 164, 1)
    const Color.fromRGBO(102, 194, 165, 1), // rgba(102, 194, 165, 1)
    const Color.fromRGBO(50, 136, 189, 1), // rgba(50, 136, 189, 1)
    const Color.fromRGBO(94, 79, 162, 1), // rgba(94, 79, 162, 1)
    const Color.fromARGB(255, 31, 55, 190), // rgba(94, 79, 162, 1)
    const Color.fromARGB(255, 83, 106, 231), // rgba(94, 79, 162, 1)
    const Color.fromARGB(255, 10, 201, 128), // rgba(94, 79, 162, 1)
  ];
  List<Widget> indicator = [];

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    pieChartResponse = await PieChartService.pieChart();
    for (var i = 0; i < pieChartResponse.pieObservations.length; i++) {
      final percentage = pieChartResponse.pieObservations[i].totalCount /
          pieChartResponse.totalObservations *
          100;
      sections.add(
        PieChartSectionData(
          color: pieChartColors[i],
          value: percentage,
          title: '${percentage.toStringAsFixed(0)}%',
          radius: 40,
          titleStyle: smallText.copyWith(color: baseWhite),
        ),
      );

      indicator.add(
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              color: pieChartColors[i],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              pieChartResponse.pieObservations[i].species
                  .replaceAll('-', ' ')
                  .capitalize!,
              style: smallText.copyWith(fontSize: 12),
            ),
          ],
        ),
      );

      indicator.add(
        const SizedBox(
          height: 4,
        ),
      );
    }

    change(true, status: RxStatus.success());

    super.onInit();
  }
}
