import 'package:butterfly_classification/app/data/model/line_chart/line_chart_range_request.dart';
import 'package:butterfly_classification/app/data/model/line_chart/line_chart_range_response.dart';
import 'package:butterfly_classification/app/data/repository/line_chart_range_repository.dart';

abstract class LineChartRangeService {
  static Future<LineChartRangeResponse> lineChart(
    LineChartRangeRequest request,
  ) async {
    try {
      return await LineChartRangeRepository.lineChart(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
