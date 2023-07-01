import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';


class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
    required this.imageUrl,
  });
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '$imageAppendUrl$imageUrl',
                  ),
                ),
              ),
            ),
            // Container(
            //   width: 150,
            //   height: 250,
            //   child: ClipRRect(
            //       borderRadius: kRadius,
            //       child: Image.network("$imageAppendUrl$imageUrl"),),
            // ),
          ],
        ),
        Positioned(
          bottom: -25,
          left: 13,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: kwhitecolor,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  color: backgroundColor,
                  fontSize: 130,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
