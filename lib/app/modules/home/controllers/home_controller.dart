import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController with StateMixin {
  late String fullName = '';
  late String imgProfile = '';
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    await loadData();
    change(true, status: RxStatus.success());
    super.onInit();
  }

  void openCamera() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
    ].request();

    if (statuses[Permission.location]!.isDenied ||
        statuses[Permission.camera]!.isDenied) {
      Get.defaultDialog(
        title: 'Notification',
        titleStyle: smallText,
        middleText: 'Please enable location and camera access',
        onConfirm: openAppSettings,
        textConfirm: 'Open Settings',
        textCancel: 'Cancel',
        confirmTextColor: baseWhite,
        buttonColor: darkBlue,
        cancelTextColor: darkBlue,
      );
    } else {
      Get.toNamed(Routes.OBSERVE);
    }
  }

  Future<void> loadData() async {
    fullName = await storage.read(key: 'name') ?? 'Guest';
    String img = await storage.read(key: 'img') ?? 'default_profil.jpg';
    imgProfile = '${ApiProvider.images}/user/$img';
  }
}
