import 'package:butterfly_classification/app/data/model/pie_charts/pie_chart_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class PieChartRepository {
  static final getConnect = GetConnect();

  static Future<PieChartResponse> pieChart() async {
    try {
      final resp = await getConnect.get(ApiProvider.pieCharts);
      print(resp.body);
      return PieChartResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
