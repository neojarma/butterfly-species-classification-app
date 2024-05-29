class ButterfliesResponse {
  final List<Butterfly> butterflies;

  ButterfliesResponse({required this.butterflies});

  factory ButterfliesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['butterflies'] as List;
    List<Butterfly> butterfliesList =
        list.map((i) => Butterfly.fromJson(i)).toList();

    return ButterfliesResponse(butterflies: butterfliesList);
  }
}

class Butterfly {
  final String species;
  final String scientificName;
  final String popularName;
  final String description;
  final String kingdom;
  final String phylum;
  final String classField;
  final String order;
  final String family;
  final String genus;
  final String distribution;
  final String continent;
  final String country;
  final String populationStatus;
  final String thumbnail;

  Butterfly({
    required this.species,
    required this.scientificName,
    required this.popularName,
    required this.description,
    required this.kingdom,
    required this.phylum,
    required this.classField,
    required this.order,
    required this.family,
    required this.genus,
    required this.distribution,
    required this.continent,
    required this.country,
    required this.populationStatus,
    required this.thumbnail,
  });

  factory Butterfly.fromJson(Map<String, dynamic> json) {
    return Butterfly(
      species: json['species'],
      scientificName: json['scientific_name'],
      popularName: json['popular_name'],
      description: json['description'],
      kingdom: json['kingdom'],
      phylum: json['phylum'],
      classField: json['class'],
      order: json['order'],
      family: json['family'],
      genus: json['genus'],
      distribution: json['distribution'],
      continent: json['continent'],
      country: json['country'],
      populationStatus: json['population_status'],
      thumbnail: json['thumbnail'],
    );
  }
}
