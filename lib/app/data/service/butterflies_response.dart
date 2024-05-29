import 'package:butterfly_classification/app/data/model/butterflies/butterflies_response.dart';
import 'package:butterfly_classification/app/data/repository/butterflies_repository.dart';

abstract class ButterfliesService {
  static Future<ButterfliesResponse> butterflies() async {
    try {
      return await ButterfliesRepository.butterflies();
    } catch (e) {
      throw Exception(e);
    }
  }
}
