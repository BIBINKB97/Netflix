import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/home/models/home_main_model.dart';
import 'package:netflix/presentation/home/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';


class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.result,
  }) : super(key: key);
  final List<ScrollImageHome> result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: MainTitle(title: "Top 10 Show in india Today"),
        ),
        kheight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              result.length > 10 ? 10 : result.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: NumberCard(
                  index: index,
                  imageUrl: result[index].bagroudimage,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
