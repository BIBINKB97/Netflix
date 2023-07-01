import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final String imgeUrl;
  const MainCard({
    Key? key,
    required this.imgeUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '$imageAppendUrl$imgeUrl',
          ),
        ),
      ),
    );
  }
}
