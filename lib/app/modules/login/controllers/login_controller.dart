import 'package:butterfly_classification/app/core/themes/custom_snackbar_theme.dart';
import 'package:butterfly_classification/app/data/model/login/login_request.dart';
import 'package:butterfly_classification/app/data/service/login_service.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    intializeController();
    change(true, status: RxStatus.success());

    super.onInit();
  }

  void intializeController() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackbar.failedSnackbar(
        title: 'Failed',
        message: 'Please input username and password',
      );
      return;
    }

    final inputtedUsername = usernameController.text;
    final inputtedPassword = passwordController.text;

    final loginRequest = LoginRequest(
      username: inputtedUsername,
      password: inputtedPassword,
    );

    change(false, status: RxStatus.loading());
    final loginResult = await LoginService.login(loginRequest);
    change(true, status: RxStatus.success());

    if (loginResult.statusCode != 200) {
      CustomSnackbar.failedSnackbar(
        title: 'Failed',
        message: loginResult.message,
      );
      return;
    }

    DateTime now = DateTime.now();
    DateTime expiryTime = now.add(const Duration(hours: 71));
    String formattedExpiryTime = expiryTime.toString();

    await storage.write(key: 'token', value: loginResult.accessToken);
    await storage.write(key: 'email', value: loginResult.user.email);
    await storage.write(key: 'name', value: loginResult.user.fullName);
    await storage.write(key: 'username', value: loginResult.user.username);
    await storage.write(key: 'img', value: loginResult.user.imagePath);
    await storage.write(key: 'expired', value: formattedExpiryTime);

    Get.offAllNamed(Routes.HOME, arguments: loginResult);
  }
}
