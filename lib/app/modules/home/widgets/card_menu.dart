import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final double marginLeft;
  final double marginRight;
  final String title;
  final IconData icon;
  final VoidCallback callback;

  const CardMenu(
      {super.key,
      required this.marginLeft,
      required this.marginRight,
      required this.title,
      required this.icon,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        height: 100,
        width: 100,
        // color: Colors.red,
        decoration: BoxDecoration(
          color: baseWhite,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: baseWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: lightBlue,
                size: 50,
              ),
            ),
            Text(
              title,
              style: smallText,
            )
          ],
        ),
      ),
    );
  }
}
