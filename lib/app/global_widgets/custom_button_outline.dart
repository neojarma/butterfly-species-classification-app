import 'package:flutter/material.dart';

import '../core/themes/font_themes.dart';

class CustomButtonOutlined extends StatelessWidget {
  const CustomButtonOutlined({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  final VoidCallback onTap;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 2.0,
          ), // Set border color and width
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: buttonText.copyWith(
              color: color,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
