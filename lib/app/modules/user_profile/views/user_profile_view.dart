import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.refreshProfile,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      CachedNetworkImageProvider(controller.profileImage),
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
                const SizedBox(
                  height: 40,
                ),
                CustomButtonFillColor(
                  label: 'Edit Profile',
                  onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                  color: darkBlue,
                ),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.1,
                ),
                CustomButtonFillColor(
                  label: 'Logout',
                  onTap: controller.logout,
                  color: red,
                ),
              ],
            ),
          ),
        ),
        onLoading: const Center(
          child: LoadingSpinkit(),
        ),
      ),
    );
  }
}
