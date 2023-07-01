import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/core/debounce.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Dbouncer(miiliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.3),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white54),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                },
              ),
              kheight,
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.searchResultList.isEmpty) {
                      return const SearchIdleWidget();
                    } else {
                      return const SearchResultwidget();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: kwhitecolor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
