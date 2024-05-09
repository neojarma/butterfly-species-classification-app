class PredictResponse {
  final String predictedSpecies;
  final String percentageConfidence;

  PredictResponse({
    required this.predictedSpecies,
    required this.percentageConfidence,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      percentageConfidence: json['percent'],
      predictedSpecies: json['class'],
    );
  }
}
