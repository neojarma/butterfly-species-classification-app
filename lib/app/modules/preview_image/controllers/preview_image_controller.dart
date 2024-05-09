import 'package:butterfly_classification/app/data/model/predict/predict_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class PreviewImageController extends GetxController with StateMixin {
  final tempImagePath = Get.arguments["imageFile"];
  final dioHttp = dio.Dio();

  void doClassification() async {
    change(true, status: RxStatus.loading());

    String fileNameUp = tempImagePath.path.split('/').last;

    final dio.FormData formData = dio.FormData.fromMap({
      "image":
          await dio.MultipartFile.fromFile(tempImagePath, filename: fileNameUp),
    });

    dio.Response<dynamic> response;

    try {
      response = await dioHttp.post(ApiProvider.predict, data: formData);
    } catch (e) {
      response = await dioHttp.post(ApiProvider.predict, data: formData);
    }

    final result = PredictResponse.fromJson(response.data);

    var userPosition = await _determinePosition();

    change(true, status: RxStatus.success());

    // Get.toNamed(Routes.CORAL_CLASSIFICATION_RESULT, arguments: arg);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
