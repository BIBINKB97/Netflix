import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/home/home_firstimage.dart';
import 'package:netflix/infrastructure/home/home_release_poster.dart';
import 'package:netflix/infrastructure/home/south_indian_movie.dart';
import 'package:netflix/infrastructure/home/tense_drama.dart';
import 'package:netflix/infrastructure/home/top_10_show_in_india_today.dart';
import 'package:netflix/infrastructure/home/trending_now.dart';
import 'package:netflix/presentation/home/background_card.dart';
import 'package:netflix/presentation/home/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';
import 'package:netflix/presentation/widgets/netflix_profile.dart';

ValueNotifier<bool> scrollNotifire = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: homefirstimage,
        builder: (context, homeImage, _) {
          return homeImage.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ValueListenableBuilder(
                  valueListenable: scrollNotifire,
                  builder: (BuildContext context, index, _) {
                    return NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        final ScrollDirection direction =
                            notification.direction;
                        if (direction == ScrollDirection.reverse) {
                          scrollNotifire.value = false;
                        } else if (direction == ScrollDirection.forward) {
                          scrollNotifire.value = true;
                        }
                        return true;
                      },
                      child: Stack(
                        children: [
                          ListView(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: homefirstimage,
                                  builder: (context, result, _) {
                                    if (result.isNotEmpty) {
                                      return HomeFirstContainer(
                                        imageUrl: result[0].bagroudimage,
                                      );
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  }),
                              kheight,
                              ValueListenableBuilder(
                                valueListenable: relesethePastYear,
                                builder: (context, reslt, _) {
                                  if (reslt.isNotEmpty) {
                                    return MainTitleCard(
                                      title: "Released in the past year",
                                      result: reslt,
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                              kheight,
                              ValueListenableBuilder(
                                valueListenable: trendingNow,
                                builder: (context, trendingNow, _) {
                                  if (trendingNow.isNotEmpty) {
                                    return MainTitleCard(
                                      title: "Trending Now",
                                      result: trendingNow,
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                              kheight,
                              ValueListenableBuilder(
                                valueListenable: top10showindia,
                                builder: (context, resultofsoutindianmovie, _) {
                                  if (resultofsoutindianmovie.isNotEmpty) {
                                    return NumberTitleCard(
                                      result: resultofsoutindianmovie,
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                              kheight,
                              ValueListenableBuilder(
                                valueListenable: tendeAndDrama,
                                builder: (context, resultTenseDrama, _) {
                                  if (resultTenseDrama.isNotEmpty) {
                                    return MainTitleCard(
                                      title: " Tense Dramas",
                                      result: resultTenseDrama,
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                              kheight,
                              ValueListenableBuilder(
                                valueListenable: southindianmovie,
                                builder: (context, resultodfsutindianmovie, _) {
                                  if (resultodfsutindianmovie.isNotEmpty) {
                                    return MainTitleCard(
                                      title: "Sout indian Cinema",
                                      result: resultodfsutindianmovie,
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          scrollNotifire.value == true
                              ? AnimatedContainer(
                                  duration: const Duration(milliseconds: 1500),
                                  width: double.infinity,
                                  height: 80,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://www.pngarts.com/files/1/Netflix-Logo-PNG-Transparent-Image.png",
                                          height: 60,
                                          width: 70,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        kwidth,
                                        const NetflixProfile(),
                                        kwidth,
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "TV Shows",
                                          style: khomeTitleText,
                                        ),
                                        Text(
                                          "Movies",
                                          style: khomeTitleText,
                                        ),
                                        Text(
                                          "Categories",
                                          style: khomeTitleText,
                                        ),
                                      ],
                                    )
                                  ]),
                                )
                              : kheight,
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

TextButton playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhitecolor)),
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: backgroundColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "Play",
        style: TextStyle(
            fontSize: 20, color: backgroundColor, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
