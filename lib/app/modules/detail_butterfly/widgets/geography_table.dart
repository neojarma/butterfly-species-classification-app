import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/modules/detail_butterfly/controllers/detail_butterfly_controller.dart';
import 'package:flutter/widgets.dart';

class GeographyTable extends StatelessWidget {
  const GeographyTable({
    super.key,
    required this.controller,
  });

  final DetailButterflyController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Continent',
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              'Country',
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
              ':',
              style: textfieldText.copyWith(fontSize: 13),
            ),
            Text(
              ':',
              style: textfieldText.copyWith(fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.butterfly.continent,
                style: textfieldText.copyWith(fontSize: 13),
              ),
              Text(
                controller.butterfly.country,
                style: textfieldText.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
      ],
    );
  }
}
