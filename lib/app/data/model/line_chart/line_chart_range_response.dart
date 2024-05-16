class LineChartRangeResponse {
  final int count;
  final List<LineChartRange> lineChartRange;

  LineChartRangeResponse({
    required this.count,
    required this.lineChartRange,
  });

  factory LineChartRangeResponse.fromJson(Map<String, dynamic> json) {
    if ((json['obs'] as List<dynamic>).isEmpty) {
      return LineChartRangeResponse(lineChartRange: [], count: 0);
    }

    return LineChartRangeResponse(
      lineChartRange: (json['obs'] as List<dynamic>)
          .map((e) => LineChartRange.fromJson(e))
          .toList(),
      count: json['count'],
    );
  }
}

class LineChartRange {
  final String species;
  final int totalCount;
  final int year;

  LineChartRange({
    required this.species,
    required this.totalCount,
    required this.year,
  });

  factory LineChartRange.fromJson(Map<String, dynamic> json) {
    return LineChartRange(
      species: json['species'],
      totalCount: json['total_count'],
      year: json['year'],
    );
  }
}
