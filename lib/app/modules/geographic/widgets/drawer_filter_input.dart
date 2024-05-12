import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class DrawerFilterInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLength;

  const DrawerFilterInput({
    super.key,
    required this.maxLength,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: buttonText,
          ),
          SizedBox(
            height: 65,
            child: TextField(
              maxLength: maxLength,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lightBlue, width: 1.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lightBlue, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
