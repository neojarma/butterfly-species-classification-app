import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTitle extends StatelessWidget {
  final String title;

  const DetailTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: Get.width,
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: smallText.copyWith(color: baseWhite),
      ),
    );
  }
}
