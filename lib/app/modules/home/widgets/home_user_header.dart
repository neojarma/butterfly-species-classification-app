import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/global_widgets/loading_spinkit.dart';
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
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              placeholder: (context, url) => const LoadingSpinkit(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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
