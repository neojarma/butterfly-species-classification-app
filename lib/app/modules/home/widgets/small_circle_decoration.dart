import 'package:flutter/material.dart';

class SmallCircleDecoration extends StatelessWidget {
  final int heightDivider;
  final double? left;
  final double? right;

  const SmallCircleDecoration({
    super.key,
    required this.heightDivider,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height / heightDivider),
      left: left,
      right: right,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6000),
            color: const Color(0xff02A2DC),
          ),
          width: 220,
          height: 220,
        ),
      ),
    );
  }
}
