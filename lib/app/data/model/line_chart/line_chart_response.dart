class LineChartResponse {
  final int count;
  final List<LineChart> lineChart;

  LineChartResponse({
    required this.count,
    required this.lineChart,
  });

  factory LineChartResponse.fromJson(Map<String, dynamic> json) {
    if ((json['obs'] as List<dynamic>).isEmpty) {
      return LineChartResponse(lineChart: [], count: 0);
    }

    return LineChartResponse(
      lineChart: (json['obs'] as List<dynamic>)
          .map((e) => LineChart.fromJson(e))
          .toList(),
      count: json['count'],
    );
  }
}

class LineChart {
  final String species;
  final int totalCount;
  final int month;

  LineChart({
    required this.species,
    required this.totalCount,
    required this.month,
  });

  factory LineChart.fromJson(Map<String, dynamic> json) {
    return LineChart(
      species: json['species'],
      totalCount: json['total_count'],
      month: json['month'],
    );
  }
}
