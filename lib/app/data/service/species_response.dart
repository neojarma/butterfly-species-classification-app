import 'package:butterfly_classification/app/data/model/species/species_response.dart';
import 'package:butterfly_classification/app/data/repository/species_repository.dart';

abstract class SpeciesService {
  static Future<SpeciesResponse> species() async {
    try {
      return await SpeciesRepository.species();
    } catch (e) {
      throw Exception(e);
    }
  }
}
