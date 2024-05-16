import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/modules/geographic/controllers/geographic_controller.dart';
import 'package:flutter/material.dart';

class SpeciesChipsFilter extends StatelessWidget {
  const SpeciesChipsFilter({
    super.key,
    required this.controller,
  });

  final GeographicController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Species',
                style: buttonText,
              ),
              GestureDetector(
                onTap: () {
                  for (var element in controller.speciesInit) {
                    element.isClicked.value = false;
                  }
                },
                child: Text(
                  'Reset',
                  style: buttonText,
                ),
              )
            ],
          ),
          Wrap(
            spacing: 4,
            children: controller.filterChips,
          ),
        ],
      ),
    );
  }
}
