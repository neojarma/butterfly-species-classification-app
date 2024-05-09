import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

late List<CameraDescription> allAvailableCameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  allAvailableCameras = await availableCameras();

  String route = AppPages.INITIAL;
  String? expired = await storage.read(key: 'expired');
  if (expired != null) {
    DateTime parsedExpiryTime = DateTime.parse(expired);
    DateTime now = DateTime.now();

    if (now.isBefore(parsedExpiryTime)) {
      route = AppPages.HOME;
    }
  }

  runApp(
    GetMaterialApp(
      theme: ThemeData(primaryColor: baseWhite),
      title: "Application",
      initialRoute: route,
      getPages: AppPages.routes,
    ),
  );
}
