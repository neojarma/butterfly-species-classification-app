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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
              controller.obx(
                (state) => (controller.isEnhanced.value)
                    ? Column(
                        children: [
                          Text(
                            'Original Image',
                            style: headline4.copyWith(fontSize: 20),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Obx(
                              () => Image.memory(
                                controller.tempImageObs.value,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButtonFillColor(
                            label: 'Use Original image',
                            onTap: controller.doClassification,
                            color: darkBlue,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButtonOutlined(
                            label: 'Edit Original Image',
                            onTap: () => controller.editImage(context),
                            color: darkBlue,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Enhanced Image',
                            style: headline4.copyWith(fontSize: 20),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Obx(
                              () => Image.network(
                                controller.enhancedURL.value,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButtonFillColor(
                            label: 'Use Enhanced Image',
                            onTap: controller.doClassificationEnhanced,
                            color: green,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButtonOutlined(
                            label: 'Re-Enhanced Original Image',
                            onTap: controller.enhanceImage,
                            color: green,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Obx(
                              () => Image.memory(
                                controller.tempImageObs.value,
                                height: MediaQuery.of(context).size.height / 3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButtonFillColor(
                            label: 'Use Original image',
                            onTap: controller.doClassification,
                            color: darkBlue,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButtonOutlined(
                            label: 'Edit Original Image',
                            onTap: () => controller.editImage(context),
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
                          CustomButtonFillColor(
                            label: 'Enhance Image',
                            onTap: () {
                              controller.enhanceImage();
                            },
                            color: green,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
