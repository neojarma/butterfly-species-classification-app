import 'package:butterfly_classification/app/data/model/butterflies/butterflies_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class ButterfliesRepository {
  static final getConnect = GetConnect();

  static Future<ButterfliesResponse> butterflies() async {
    try {
      final resp = await getConnect.get(ApiProvider.butterflies);
      return ButterfliesResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
