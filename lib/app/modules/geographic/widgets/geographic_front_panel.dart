import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/modules/geographic/controllers/geographic_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeographicFrontPanel extends StatelessWidget {
  const GeographicFrontPanel({
    super.key,
    required this.controller,
  });

  final GeographicController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            SizedBox(
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Divider(
                  color: grey,
                  thickness: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Text(
              'Observation Result',
              style: headline4.copyWith(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Founded Species',
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Reported by',
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Reported Image',
                      style: headline7,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      ':',
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      ':',
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      ':',
                      style: headline7,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.currentLocationClicked.value.species
                          .replaceAll('-', ' ')
                          .capitalize!,
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.currentLocationClicked.value.fullName,
                      style: headline7,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.currentLocationClicked.value.fullName,
                      style: headline7.copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () => controller.previewImageOnline(
                context,
                controller.currentLocationClicked.value.observedImage,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 170,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          controller.currentLocationClicked.value.observedImage,
                      placeholder: (context, url) => const SizedBox(
                        height: 100,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
