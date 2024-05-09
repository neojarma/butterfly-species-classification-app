import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/custom_textfield.dart';
import 'package:butterfly_classification/app/global_widgets/footer_text.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  List<CustomTextField> regiterFields() {
    return [
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.fullNameController,
        icon: Icons.account_circle,
        label: 'Full Name',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.usernameController,
        icon: Icons.person,
        label: 'Username',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.emailController,
        icon: Icons.email,
        label: 'Email',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.passwordController,
        icon: Icons.lock,
        label: 'Password',
        isObscure: true,
      ),
    ];
  }

  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: headline4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...regiterFields().map(
                (field) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: field,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButtonFillColor(
                label: 'Sign Up',
                onTap: controller.handleRegister,
                color: darkBlue,
              ),
              SizedBox(
                height: 50,
                child: controller.obx(
                  (state) => const SizedBox.shrink(),
                  onLoading: const Center(
                    child: LoadingSpinkit(),
                  ),
                ),
              ),
              FooterText(
                label: 'Already Registered? ',
                labelWithFunction: 'Login',
                ontap: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
