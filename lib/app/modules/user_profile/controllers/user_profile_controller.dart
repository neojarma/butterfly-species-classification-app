import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserProfileController extends GetxController with StateMixin {
  final refreshController = RefreshController();
  final storage = const FlutterSecureStorage();
  String email = '';
  String name = '';
  String profileImage = '';

  @override
  void onInit() {
    intializeUserProfile();

    super.onInit();
  }

  Future<void> refreshProfile() async {
    change(false, status: RxStatus.loading());
    email = (await storage.read(key: 'email'))!;
    name = (await storage.read(key: 'name'))!;
    final img = (await storage.read(key: 'img'));
    profileImage = '${ApiProvider.images}/user/$img';
    change(true, status: RxStatus.success());
  }

  void logout() async {
    await storage.deleteAll();
    Get.offAllNamed(Routes.LOGIN);
  }

  void intializeUserProfile() async {
    change(false, status: RxStatus.loading());
    email = (await storage.read(key: 'email'))!;
    name = (await storage.read(key: 'name'))!;
    final img = (await storage.read(key: 'img'));
    profileImage = '${ApiProvider.images}/user/$img';
    change(true, status: RxStatus.success());
  }
}
