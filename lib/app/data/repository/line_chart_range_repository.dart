import 'package:butterfly_classification/app/data/model/line_chart/line_chart_range_request.dart';
import 'package:butterfly_classification/app/data/model/line_chart/line_chart_range_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class LineChartRangeRepository {
  static final getConnect = GetConnect();

  static Future<LineChartRangeResponse> lineChart(
    LineChartRangeRequest request,
  ) async {
    try {
      final resp = await getConnect.post(
        ApiProvider.chartDetailRange,
        request.toJson(),
      );
      return LineChartRangeResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
