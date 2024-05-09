import 'package:flutter/material.dart';

import '../core/themes/font_themes.dart';

class CustomButtonFillColor extends StatelessWidget {
  const CustomButtonFillColor({
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
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: buttonText.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
