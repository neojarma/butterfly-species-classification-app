import 'dart:io';

import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_outline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              borderRadius: BorderRadius.circular(
                  10), // Adjust the value to change the roundness
              child: Image.file(
                File(controller.tempImagePath),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: 'loading',
              child: CustomButtonFillColor(
                label: 'Use this image',
                onTap: () {},
                color: darkBlue,
              ),
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
              label: 'Retake',
              onTap: () => Get.back(),
              color: darkBlue,
            )
          ],
        ),
      ),
    );
  }
}
