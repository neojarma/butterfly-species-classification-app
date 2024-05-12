import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_outline.dart';
import 'package:butterfly_classification/app/global_widgets/custom_textfield.dart';
import 'package:butterfly_classification/app/global_widgets/footer_text.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome !!!',
                    style: headline4,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  textStyle: headline6,
                  isObscure: false,
                  controller: controller.usernameController,
                  label: 'Username',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textStyle: headline6,
                  isObscure: true,
                  controller: controller.passwordController,
                  label: 'Password',
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonFillColor(
                  color: lightBlue,
                  label: 'Login',
                  onTap: controller.handleLogin,
                ),
                controller.obx(
                  (state) => Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      FooterText(
                        label: 'Don\'t have an account? ',
                        labelWithFunction: 'Register',
                        ontap: () => Get.toNamed(Routes.REGISTER),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Or',
                        style: smallText,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonOutlined(
                        color: lightBlue,
                        label: 'Continue as Guest',
                        onTap: controller.continueAsGuest,
                      ),
                    ],
                  ),
                  onLoading: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      LoadingSpinkit(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
