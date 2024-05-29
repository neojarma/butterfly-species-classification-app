import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/controllers/detail_butterfly_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassificationTable extends StatelessWidget {
  const ClassificationTable({
    super.key,
    required this.controller,
  });

  final DetailButterflyController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kingdom",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Phylum",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Class",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Order",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Family",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Genus",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              "Species",
              style: textfieldText.copyWith(fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ":",
              style: textfieldText.copyWith(fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.butterfly.kingdom,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.phylum,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.classField,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.order,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.family,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.genus,
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              controller.butterfly.species.replaceAll('-', ' ').capitalize!,
              style: textfieldText.copyWith(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
