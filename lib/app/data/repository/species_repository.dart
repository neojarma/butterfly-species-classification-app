import 'package:butterfly_classification/app/data/model/species/species_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class SpeciesRepository {
  static final getConnect = GetConnect();

  static Future<SpeciesResponse> species() async {
    try {
      final resp = await getConnect.get(ApiProvider.species);
      return SpeciesResponse.fromJson(resp.body);
    } catch (e) {
      throw Exception('Failed to send request ${e.toString()}');
    }
  }
}
