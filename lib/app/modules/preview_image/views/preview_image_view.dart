import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_outline.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preview_image_controller.dart';

class PreviewImageView extends GetView<PreviewImageController> {
  const PreviewImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preview Image',
          style: mediumText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Obx(
                () => Image.memory(
                  controller.tempImageObs.value,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            controller.obx(
              (state) => Column(
                children: [
                  CustomButtonFillColor(
                    label: 'Use this image',
                    onTap: controller.doClassification,
                    color: darkBlue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Or',
                    style: smallText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonOutlined(
                    label: 'Edit',
                    onTap: () => controller.editImage(context),
                    color: darkBlue,
                  )
                ],
              ),
              onLoading: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const LoadingSpinkit(),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Loading...',
                    style: mediumText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
