import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/custom_button_filled.dart';
import 'package:butterfly_classification/app/modules/geographic/widgets/drawer_filter_input.dart';
import 'package:butterfly_classification/app/modules/geographic/widgets/species_chips_filter.dart';
import 'package:flutter/material.dart';

import '../controllers/geographic_controller.dart';

class GeographicDrawerFilter extends StatelessWidget {
  const GeographicDrawerFilter({
    super.key,
    required this.controller,
  });

  final GeographicController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: lightBlue,
            ),
            child: Center(
              child: Text(
                'Geographic Filter',
                style: headline6.copyWith(
                  color: baseWhite,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          DrawerFilterInput(
            controller: controller.monthController,
            label: 'Month',
            maxLength: 2,
          ),
          DrawerFilterInput(
            maxLength: 4,
            label: 'Year',
            controller: controller.yearController,
          ),
          SpeciesChipsFilter(controller: controller),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: CustomButtonFillColor(
              label: 'Apply Filter',
              onTap: controller.doFiltering,
              color: lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
