import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.image,
    required this.onTap,
  });

  final ImageProvider image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
          child: InkWell(
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
