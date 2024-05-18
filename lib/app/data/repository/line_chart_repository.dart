import 'package:butterfly_classification/app/data/model/line_chart/line_chart_request.dart';
import 'package:butterfly_classification/app/data/model/line_chart/line_chart_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class LineChartRepository {
  static final getConnect = GetConnect();

  static Future<LineChartResponse> lineChart(
    LineChartRequest request,
  ) async {
    try {
      final resp = await getConnect.post(
        ApiProvider.chartDetail,
        request.toJson(),
      );
      return LineChartResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
