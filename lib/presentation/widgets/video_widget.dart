import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';


class VideoWidget extends StatelessWidget {
  final bgimage;
  const VideoWidget({
    Key? key,
    required this.bgimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            '$imageAppendUrl$bgimage',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const CircularProgressIndicator(),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black26,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kwhitecolor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}