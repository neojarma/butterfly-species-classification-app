class Enhanced {
  final String url;

  Enhanced({
    required this.url,
  });

  factory Enhanced.fromJson(Map<String, dynamic> json) {
    return Enhanced(url: json['enhanced_image_url']);
  }
}
