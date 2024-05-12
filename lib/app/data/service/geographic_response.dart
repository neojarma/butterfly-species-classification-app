import 'package:butterfly_classification/app/data/model/geographic/geographic_request.dart';
import 'package:butterfly_classification/app/data/model/geographic/geographic_response.dart';
import 'package:butterfly_classification/app/data/repository/geographic_repository.dart';

abstract class GeographicService {
  static Future<GeographicResponse> geographic(
    GeographicRequest request,
  ) async {
    try {
      return await GeographicRepository.geographic(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
