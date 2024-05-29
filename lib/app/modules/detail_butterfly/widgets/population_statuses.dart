import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/controllers/detail_butterfly_controller.dart';
import 'package:flutter/material.dart';

class PopulationStatuses extends StatelessWidget {
  const PopulationStatuses({
    super.key,
    required this.controller,
  });

  final DetailButterflyController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controller.speciesStatus
            .map(
              (e) => Tooltip(
                message: controller.statuses[e],
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: e == controller.currentSpeciesStatus
                        ? lightBlue
                        : baseWhite,
                    border: Border.all(
                      color: lightBlue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(
                        color: e == controller.currentSpeciesStatus
                            ? baseWhite
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
