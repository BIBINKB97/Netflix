import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

class HomeFirstContainer extends StatelessWidget {
  const HomeFirstContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '$imageAppendUrl$imageUrl',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(icon: Icons.add, title: "My List"),
                playButton(),
                const CustomButtonWidget(
                  icon: Icons.info_outline,
                  title: "Info",
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
