import 'dart:typed_data';

import 'package:butterfly_classification/app/core/themes/custom_snackbar_theme.dart';
import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/data/model/predict/predict_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';

class ClassificationResultController extends GetxController with StateMixin {
  final result = Get.arguments["result"] as PredictResponse;
  final prevImage = Get.arguments["previmg"] as Uint8List;
  final isEnhanced = Get.arguments['isEnhanced'] as bool;
  final enhancedFilePath = Get.arguments['enhancedFilePath'] as String;
  final enhanceURL = Get.arguments['enhancedURL'] as String;
  final filePath = Get.arguments['filePath'] as String;

  FlutterSecureStorage storage = const FlutterSecureStorage();
  late final bool isGuest;
  final TextEditingController counterController = TextEditingController();
  final dioHttp = dio.Dio();

  void uploadObservation(Position position, PredictResponse resp) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final dio.FormData formData = dio.FormData.fromMap(
      {
        "image": isEnhanced
            ? await dio.MultipartFile.fromFile(
                enhancedFilePath,
                filename: filePath.split('/').last,
              )
            : dio.MultipartFile.fromBytes(
                prevImage,
                filename: filePath.split('/').last,
              ),
        "species": resp.predictedSpecies,
        "total": int.tryParse(counterController.text),
        "date": formattedDate,
        "lon": position.longitude,
        "lat": position.latitude,
      },
    );

    final token = await storage.read(key: 'token');
    dio.Options options = dio.Options(headers: {
      'Authorization': 'Bearer $token',
    });

    try {
      change(false, status: RxStatus.loading());
      await dioHttp.post(ApiProvider.observations,
          data: formData, options: options);

      Get.back();
    } catch (e) {
      throw Exception('Failed to send request $e');
    }

    CustomSnackbar.successSnackbar(
      title: 'Observation Uploaded',
      message: 'Redirecting to Home Menu',
    );

    change(true, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  void previewImageOffline(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: Image.memory(
                prevImage,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    isGuest = await storage.read(key: 'token') == null;
    change(true, status: RxStatus.success());

    super.onInit();
  }

  void openDialogObservation() async {
    final userPosition = await _determinePosition();

    Get.defaultDialog(
      title:
          'How many ${result.predictedSpecies.replaceAll('-', ' ').capitalize!}\nButterflies do you see?',
      titleStyle: smallText,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: TextField(
                    controller: counterController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    'Butterflies',
                    style: smallText.copyWith(fontWeight: FontWeight.w100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onConfirm: () => uploadObservation(userPosition, result),
      textConfirm: 'Submit',
      textCancel: 'Cancel',
      confirmTextColor: baseWhite,
      buttonColor: darkBlue,
      cancelTextColor: darkBlue,
    );
  }

  void previewImageOnline(BuildContext context, String url) async {
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
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
      CustomSnackbar.failedSnackbar(
        title: 'Error',
        message: 'Please enable GPS to proceed.',
      );
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
        CustomSnackbar.failedSnackbar(
          title: 'Error',
          message: 'Location permissions are denied.',
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      CustomSnackbar.failedSnackbar(
        title: 'Error',
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
