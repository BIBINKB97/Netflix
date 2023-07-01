import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';

import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/infrastructure/home/home_firstimage.dart';
import 'package:netflix/infrastructure/home/home_release_poster.dart';
import 'package:netflix/infrastructure/home/south_indian_movie.dart';
import 'package:netflix/infrastructure/home/tense_drama.dart';
import 'package:netflix/infrastructure/home/top_10_show_in_india_today.dart';
import 'package:netflix/infrastructure/home/trending_now.dart';
import 'package:netflix/infrastructure/hot_and_new/coming_soon.dart';
import 'package:netflix/infrastructure/hot_and_new/everyone_watching.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  getHotAndSNewEveryWatching();
  getHotandNewComingSoon();
  getHomeImage();
  getHomerelesethePastYear();
  getHomeTrendingNow();
  getHomeTendeAndDrama();
  getHomeSouthIndian();
  getHomeTop10showindia();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
