import 'package:flutter/material.dart';

import '../core/themes/font_themes.dart';
import '../core/values/colors.dart';

class FooterText extends StatelessWidget {
  const FooterText({
    super.key,
    required this.label,
    required this.labelWithFunction,
    required this.ontap,
  });

  final VoidCallback ontap;
  final String label;
  final String labelWithFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: smallText),
        GestureDetector(
          onTap: ontap,
          child: Text(
            labelWithFunction,
            style: smallText.copyWith(color: lightBlue),
          ),
        )
      ],
    );
  }
}
