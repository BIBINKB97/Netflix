import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.textSize = 17,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
