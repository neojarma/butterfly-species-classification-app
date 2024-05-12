import 'package:butterfly_classification/app/data/model/geographic/geographic_request.dart';
import 'package:butterfly_classification/app/data/model/geographic/geographic_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class GeographicRepository {
  static final getConnect = GetConnect();

  static Future<GeographicResponse> geographic(
    GeographicRequest request,
  ) async {
    try {
      final fullPathUrl =
          '${ApiProvider.observations}?species=${request.species}&year=${request.year}&month=${request.month}';
      print(fullPathUrl);
      final resp = await getConnect.get(fullPathUrl);
      return GeographicResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
