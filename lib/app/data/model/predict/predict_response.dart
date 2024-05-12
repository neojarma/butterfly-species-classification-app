class PredictResponse {
  final String predictedSpecies;
  final double percentageConfidence;
  final List<String> images;

  PredictResponse({
    required this.predictedSpecies,
    required this.percentageConfidence,
    required this.images,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      images: (json['images'] as List<dynamic>).cast<String>(),
      percentageConfidence: json['percent'],
      predictedSpecies: json['class'],
    );
  }
}
