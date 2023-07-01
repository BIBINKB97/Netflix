import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

import 'package:netflix/presentation/widgets/video_widget.dart';


class CommingSoonWidget extends StatelessWidget {
  CommingSoonWidget({
    required this.description,
    required this.month,
    required this.date,
    required this.movieName,
    required this.bgimage,
    Key? key,
  }) : super(key: key);
  final String description;
  final String month;
  final String date;
  final String movieName;
  final String bgimage;
  final monthList = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthList[int.parse(date.split('-')[1]) - 1],
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey),
              ),
              Text(
                date.split('-').last,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(bgimage: bgimage),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,

                        ///  letterSpacing: -4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children:  const [
                      CustomButtonWidget(
                        icon: Icons.notifications_active_outlined,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 13,
                      ),
                      kwidth,
                      const CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20,
                        textSize: 13,
                      ),
                      kwidth
                    ],
                  ),
                ],
              ),
              kheight,
              const Text(
                "Comming on Friday",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
              ),
              kheight20,
              FittedBox(
                child: Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              kheight,
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}