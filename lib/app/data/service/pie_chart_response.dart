import 'package:butterfly_classification/app/data/model/pie_charts/pie_chart_response.dart';
import 'package:butterfly_classification/app/data/repository/pie_chart_repository.dart';

abstract class PieChartService {
  static Future<PieChartResponse> pieChart() async {
    try {
      return await PieChartRepository.pieChart();
    } catch (e) {
      throw Exception(e);
    }
  }
}
