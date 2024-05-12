import 'package:get/get.dart';

class SpeciesResponse {
  final List<Species> species;

  SpeciesResponse({required this.species});

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) {
    return SpeciesResponse(
      species: (json['species'] as List<dynamic>)
          .cast<String>()
          .map(
            (e) => Species(
              species: e,
              isClicked: RxBool(false),
            ),
          )
          .toList(),
    );
  }
}

class Species {
  final String species;
  final RxBool isClicked;

  Species({
    required this.species,
    required this.isClicked,
  });
}
