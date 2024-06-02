import 'dart:io';

import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/font_themes.dart';
import '../../../global_widgets/loading_spinkit.dart';
import '../controllers/edit_profile_controller.dart';
import 'build_circle_image.dart';
import 'edit_icon_circle_image.dart';
import 'edit_profile_text_field.dart';

class EditProfileBuilder extends GetView<EditProfileController> {
  final EditProfileController editProfileController;

  const EditProfileBuilder({
    super.key,
    required this.editProfileController,
  });

  List<EditProfileTextField> buildEditProfileTextFields() {
    return [
      EditProfileTextField(
        controller: controller.nameController,
        label: 'Name',
      ),
      EditProfileTextField(
        controller: controller.emailController,
        label: 'Email',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Obx(() {
                if (controller.isImageChange.value) {
                  return CircleImage(
                    image: Image.file(
                      File(controller.temporaryImagePath),
                    ).image,
                    onTap: controller.pickImage,
                  );
                }

                return CircleImage(
                  image: CachedNetworkImageProvider(controller.profileImage),
                  onTap: controller.pickImage,
                );
              }),
              const EditIconOnCircleImage(
                backgroundColor: darkBlue,
                icon: Icons.edit,
                iconColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            controller.name,
            style: profileTextStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            controller.email,
            style: subtitleProfileTextStyle,
          ),
          ...buildEditProfileTextFields().map(
            (textField) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                textField,
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButtonFillColor(
            label: 'Submit Changes',
            onTap: controller.handleEditProfile,
            color: darkBlue,
          ),
          SizedBox(
            child: controller.obx(
              (state) => const SizedBox.shrink(),
              onLoading: const LoadingSpinkit(),
            ),
          )
        ],
      ),
    );
  }
}
