import 'package:flutter/material.dart';

class BigCircleDecoration extends StatelessWidget {
  const BigCircleDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -(MediaQuery.of(context).size.height / 4),
      left: MediaQuery.of(context).size.width / 2 - 300,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6000),
            color: const Color(0xff1892DF),
          ),
          width: 600,
          height: 600,
        ),
      ),
    );
  }
}
