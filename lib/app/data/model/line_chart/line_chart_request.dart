class LineChartRequest {
  final String species;
  final String year;

  LineChartRequest({
    required this.species,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'species': species,
      'year': year,
    };
  }
}
