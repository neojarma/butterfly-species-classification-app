import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/modules/edit_profile/widgets/edit_profile_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => EditProfileBuilder(
          editProfileController: controller,
        ),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}
