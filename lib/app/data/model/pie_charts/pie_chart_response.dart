class PieChartResponse {
  final int totalObservations;
  final List<PieObservations> pieObservations;

  PieChartResponse({
    required this.pieObservations,
    required this.totalObservations,
  });

  factory PieChartResponse.fromJson(Map<String, dynamic> json) {
    if ((json['observations'] as List<dynamic>).isEmpty) {
      return PieChartResponse(pieObservations: [], totalObservations: 0);
    }

    return PieChartResponse(
      pieObservations: (json['observations'] as List<dynamic>)
          .map((e) => PieObservations.fromJson(e))
          .toList(),
      totalObservations: json['total_observations'],
    );
  }
}

class PieObservations {
  final String species;
  final int totalCount;

  PieObservations({
    required this.species,
    required this.totalCount,
  });

  factory PieObservations.fromJson(Map<String, dynamic> json) {
    return PieObservations(
      species: json['species'],
      totalCount: json['total_count'],
    );
  }
}
