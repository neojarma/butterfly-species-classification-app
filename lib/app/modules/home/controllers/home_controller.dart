import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

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

  Future<void> loadData() async {
    fullName = await storage.read(key: 'name') ?? '';
    String img = await storage.read(key: 'img') ?? 'default_profil.jpg';
    imgProfile = ApiProvider.profileImage + img;
  }
}
