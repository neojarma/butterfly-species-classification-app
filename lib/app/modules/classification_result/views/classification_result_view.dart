import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_outline.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/classification_result_controller.dart';

class ClassificationResultView extends GetView<ClassificationResultController> {
  const ClassificationResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: controller.obx(
            (state) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonOutlined(
                    label: 'Back to Home',
                    onTap: () => Get.offAllNamed(Routes.HOME),
                    color: darkBlue,
                  ),
                ),
                controller.isGuest
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        width: 10,
                      ),
                controller.isGuest
                    ? const SizedBox.shrink()
                    : Expanded(
                        child: CustomButtonFillColor(
                          label: 'Upload',
                          onTap: controller.openDialogObservation,
                          color: darkBlue,
                        ),
                      ),
              ],
            ),
            onLoading: const LoadingSpinkit(),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Classification Result',
          style: headline6,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                controller.result.predictedSpecies
                    .replaceAll('-', ' ')
                    .capitalize!,
                style: headline4,
              ),
              Text(
                'Confidence',
                style: headline6,
              ),
              Text(
                '${controller.result.percentageConfidence.toStringAsFixed(2)}% ',
                style: headline4.copyWith(
                  fontSize: 20,
                  color:
                      controller.result.percentageConfidence > 50 ? green : red,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () => controller.previewImageOffline(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 70,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.memory(
                        controller.prevImage,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var imageUrl in controller.result.images)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          onTap: () =>
                              controller.previewImageOnline(context, imageUrl),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 100,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: imageUrl,
                                placeholder: (context, url) => const SizedBox(
                                  height: 100,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              //
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
