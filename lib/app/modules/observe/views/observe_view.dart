import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/observe_controller.dart';

class ObserveView extends GetView<ObserveController> {
  const ObserveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(controller.camController),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => controller.uploadPictureFromGallery(),
                        child: const Icon(
                          Icons.image_outlined,
                          size: 45,
                          color: baseWhite,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.takePicture(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: baseWhite,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: const Icon(
                            Icons.camera,
                            size: 70,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.flipCamera(),
                        child: const Icon(
                          Icons.flip_camera_android,
                          size: 45,
                          color: baseWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        onLoading: const Center(child: LoadingSpinkit()),
      ),
    );
  }
}
