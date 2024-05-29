import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/butterfly_controller.dart';

class ButterflyView extends GetView<ButterflyController> {
  const ButterflyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterflies'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.butterflies.length,
          itemBuilder: (context, index) => Card(
            color: Colors.white,
            child: ListTile(
              onTap: () => Get.toNamed(
                Routes.DETAIL_BUTTERFLY,
                arguments: controller.butterflies[index],
              ),
              leading: SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: controller.butterflies[index].thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                controller.butterflies[index].popularName,
                style: smallText,
              ),
              subtitle: Text(
                controller.butterflies[index].scientificName.capitalize!,
                style: smallText.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
