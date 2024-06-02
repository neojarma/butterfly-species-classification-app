import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeUserHeader extends StatelessWidget {
  final String imagePath;
  final String fullName;

  const HomeUserHeader({
    super.key,
    required this.imagePath,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            radius: 45,
            backgroundImage: CachedNetworkImageProvider(imagePath),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              style: mediumText.copyWith(color: baseWhite),
            ),
            Text(
              'Welcome',
              style: subtitleProfileTextStyle.copyWith(color: baseWhite),
            ),
          ],
        )
      ],
    );
  }
}
