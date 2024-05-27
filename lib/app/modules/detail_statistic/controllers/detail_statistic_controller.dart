import 'package:butterfly_classification/app/data/model/line_chart/line_chart_range_request.dart';
import 'package:butterfly_classification/app/data/model/line_chart/line_chart_request.dart';
import 'package:butterfly_classification/app/data/model/pie_charts/pie_chart_response.dart';
import 'package:butterfly_classification/app/data/service/line_chart_range_service.dart';
import 'package:butterfly_classification/app/data/service/line_chart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailStatisticController extends GetxController with StateMixin {
  var toggleFilter = false.obs;
  PieObservations pieObservations = Get.arguments;
  TextEditingController yearFromController = TextEditingController();
  TextEditingController yearToController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  List<List<double>> points = [];
  double min = 0;
  double max = 0;
  Set<double> backup = {};
  var selectedYear = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    fetchDataYear(DateTime.now().year);
  }

  void fetchDataYear(int year) async {
    change(false, status: RxStatus.loading());
    selectedYear.value = year.toString();
    points.clear();
    backup.clear();

    final lineChartResponse = await LineChartService.lineChart(LineChartRequest(
      species: pieObservations.species,
      year: year.toString(),
    ));

    if (lineChartResponse.lineChart.isNotEmpty) {
      min = lineChartResponse.lineChart[0].totalCount.toDouble();
      max = lineChartResponse.lineChart[0].totalCount.toDouble();
      for (var each in lineChartResponse.lineChart) {
        points.add([each.month.toDouble(), each.totalCount.toDouble()]);
        min =
            each.totalCount.toDouble() < min ? each.totalCount.toDouble() : min;
        max =
            each.totalCount.toDouble() > max ? each.totalCount.toDouble() : min;

        backup.add(each.month.toDouble());
      }

      min = lineChartResponse.lineChart.length == 1 ? 0 : min;

      points.sort((a, b) => a[0].compareTo(b[0]));

      double temp = max;
      double res = 0;
      while (temp > 0) {
        temp = temp - 30;
        res += 30;
      }
      max = res;
    }

    change(false, status: RxStatus.success());
  }

  void fetchDataYearRange(int from, int to) async {
    change(false, status: RxStatus.loading());
    selectedYear.value = '$from - $to';
    points.clear();
    backup.clear();

    final lineChartResponse = await LineChartRangeService.lineChart(
      LineChartRangeRequest(
        species: pieObservations.species,
        startYear: from.toString(),
        endYear: to.toString(),
      ),
    );

    if (lineChartResponse.lineChartRange.isNotEmpty) {
      min = lineChartResponse.lineChartRange[0].totalCount.toDouble();
      max = lineChartResponse.lineChartRange[0].totalCount.toDouble();
      for (var each in lineChartResponse.lineChartRange) {
        points.add([each.year.toDouble(), each.totalCount.toDouble()]);
        min =
            each.totalCount.toDouble() < min ? each.totalCount.toDouble() : min;
        max =
            each.totalCount.toDouble() > max ? each.totalCount.toDouble() : min;

        backup.add(each.year.toDouble());
      }

      min = lineChartResponse.lineChartRange.length == 1 ? 0 : min;

      points.sort((a, b) => a[0].compareTo(b[0]));

      double temp = max;
      double res = 0;
      while (temp > 0) {
        temp = temp - 30;
        res += 30;
      }
      max = res;
    }

    change(false, status: RxStatus.success());
  }

  void updateDataChart() async {
    final year = int.parse(yearController.text);

    fetchDataYear(year);
  }

  void updateDataChartRange() async {
    final from = int.parse(yearFromController.text);
    final to = int.parse(yearToController.text);

    fetchDataYearRange(from, to);
  }
}
