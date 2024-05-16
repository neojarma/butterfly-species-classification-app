class LineChartRangeRequest {
  final String species;
  final String startYear;
  final String endYear;

  LineChartRangeRequest({
    required this.species,
    required this.startYear,
    required this.endYear,
  });

  Map<String, dynamic> toJson() {
    return {
      'species': species,
      'start_year': startYear,
      'end_year': endYear,
    };
  }
}
