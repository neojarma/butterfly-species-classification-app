import 'package:flutter/material.dart';

class EditIconOnCircleImage extends StatelessWidget {
  const EditIconOnCircleImage({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
  });

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
