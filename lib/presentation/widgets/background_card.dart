import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(kMainimage))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  icon: Icons.info_outline,
                  title: "Info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwhitecolor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kblackcolor,
      ),
      label: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 18, color: kblackcolor),
        ),
      ),
    );
  }
}
