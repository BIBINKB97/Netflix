import 'package:flutter/material.dart';
import 'package:netflix/domain/home/models/home_main_model.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.result,
  });
  final String title;
  final List<ScrollImageHome> result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              result.length,
              (index) => MainCard(imgeUrl: result[index].bagroudimage),
            ),
          ),
        ),
      ],
    );
  }
}
