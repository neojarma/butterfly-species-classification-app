import 'package:get/get.dart';

class GeographicResponse {
  final List<Geographic> geographicResults;

  GeographicResponse({required this.geographicResults});

  factory GeographicResponse.fromJson(Map<String, dynamic> json) {
    if ((json['observations'] as List<dynamic>).isEmpty) {
      return GeographicResponse(geographicResults: []);
    }

    return GeographicResponse(
      geographicResults: (json['observations'] as List<dynamic>)
          .map((result) => Geographic.fromJson(result))
          .toList(),
    );
  }
}

class Geographic {
  final String date;
  final String fullName;
  final int id;
  final List<String> imagesReference;
  final double lat;
  final double lon;
  final String observedImage;
  final String species;
  final int total;
  final String uploadedBy;
  final RxBool isClicked;

  Geographic({
    required this.date,
    required this.fullName,
    required this.id,
    required this.imagesReference,
    required this.lat,
    required this.lon,
    required this.observedImage,
    required this.species,
    required this.total,
    required this.uploadedBy,
    required this.isClicked,
  });

  factory Geographic.fromJson(Map<String, dynamic> json) {
    return Geographic(
      date: json['date'],
      fullName: json['full_name'],
      id: json['id'],
      imagesReference:
          (json['images_reference'] as List<dynamic>).cast<String>(),
      lat: json['lat'],
      lon: json['lon'],
      observedImage: json['observed_image'],
      species: json['species'],
      total: json['total'],
      uploadedBy: json['uploaded_by'],
      isClicked: RxBool(false),
    );
  }
}
