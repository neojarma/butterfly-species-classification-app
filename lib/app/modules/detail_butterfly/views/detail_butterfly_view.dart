import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/widgets/classification_table.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/widgets/detail_title.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/widgets/geography_table.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/widgets/population_statuses.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_butterfly_controller.dart';

class DetailButterflyView extends GetView<DetailButterflyController> {
  const DetailButterflyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.butterfly.popularName.capitalize!,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: Get.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: controller.butterfly.thumbnail,
                  ),
                ),
              ),
              const DetailTitle(
                title: 'Description',
              ),
              Text(
                controller.butterfly.description,
                style: textfieldText.copyWith(fontSize: 13),
                textAlign: TextAlign.justify,
              ),
              const DetailTitle(
                title: 'Classification',
              ),
              ClassificationTable(controller: controller),
              const DetailTitle(
                title: 'Distribution',
              ),
              Text(
                controller.butterfly.distribution,
                style: textfieldText.copyWith(fontSize: 13),
              ),
              const DetailTitle(
                title: 'Geography',
              ),
              GeographyTable(controller: controller),
              const DetailTitle(
                title: 'Population Status',
              ),
              Text(
                controller.butterfly.populationStatus,
                style: textfieldText.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 8,
              ),
              PopulationStatuses(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
