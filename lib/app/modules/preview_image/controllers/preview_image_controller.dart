import 'dart:typed_data';

import 'package:butterfly_classification/app/data/model/predict/predict_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_editor_plus/image_editor_plus.dart';

class PreviewImageController extends GetxController with StateMixin {
  final String filePath = Get.arguments["filePath"];
  Uint8List tempImage = Get.arguments["imageFile"];
  Rx<Uint8List> tempImageObs = Rx<Uint8List>(Uint8List(0));
  final dioHttp = dio.Dio();

  @override
  void onInit() {
    tempImageObs.value = tempImage;
    change(true, status: RxStatus.success());
    super.onInit();
  }

  void editImage(BuildContext context) async {
    final editedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditor(
          image: tempImage,
        ),
      ),
    );
    if (editedImage != null) {
      tempImageObs.value = editedImage;
    }
  }

  void doClassification() async {
    change(false, status: RxStatus.loading());

    final dio.FormData formData = dio.FormData.fromMap(
      {
        "image": await dio.MultipartFile.fromFile(
          filePath,
          filename: filePath.split('/').last,
        ),
      },
    );

    dio.Response<dynamic> response;

    try {
      response = await dioHttp.post(ApiProvider.predict, data: formData);
    } catch (e) {
      throw Exception('Failed to send request');
    }

    final result = PredictResponse.fromJson(response.data);
    change(true, status: RxStatus.success());
    Get.offAndToNamed(Routes.CLASSIFICATION_RESULT, arguments: {
      'result': result,
      'previmg': tempImageObs.value,
      'filePath': filePath,
    });
  }
}
