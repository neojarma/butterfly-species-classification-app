import 'package:butterfly_classification/app/data/model/line_chart/line_chart_request.dart';
import 'package:butterfly_classification/app/data/model/line_chart/line_chart_response.dart';
import 'package:butterfly_classification/app/data/repository/line_chart_repository.dart';

abstract class LineChartService {
  static Future<LineChartResponse> lineChart(
    LineChartRequest request,
  ) async {
    try {
      return await LineChartRepository.lineChart(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
