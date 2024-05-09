import 'package:butterfly_classification/app/core/themes/custom_snackbar_theme.dart';
import 'package:butterfly_classification/app/data/model/register/register_request.dart';
import 'package:butterfly_classification/app/data/service/register_service.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with StateMixin {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    initializeController();

    change(true, status: RxStatus.success());

    super.onInit();
  }

  void initializeController() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool isAnyEmptyField() {
    return fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty;
  }

  bool isAllFieldValid() {
    final isNameContainNumber = fullNameController.text.contains(
      RegExp(r'[0-9]'),
    );

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailController.text);

    return isValidEmail && !isNameContainNumber;
  }

  void handleRegister() async {
    if (isAnyEmptyField()) {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: 'Please input all fields',
      );
      return;
    }

    if (!isAllFieldValid()) {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: 'Invalid data',
      );
      return;
    }

    final name = fullNameController.text;
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;

    final request = RegisterRequest(
      name: name,
      email: email,
      username: username,
      password: password,
    );

    change(false, status: RxStatus.loading());
    final registResult = await RegisterService.register(request);
    change(true, status: RxStatus.success());

    if (registResult.statusCode != 200) {
      CustomSnackbar.failedSnackbar(
        title: 'Registration Failed',
        message: registResult.message,
      );

      return;
    }

    CustomSnackbar.successSnackbar(
      title: 'Registration Success',
      message: 'Redirecting to login page',
    );

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.LOGIN);
    });
  }
}
