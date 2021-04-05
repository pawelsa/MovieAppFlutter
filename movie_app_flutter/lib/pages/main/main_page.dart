import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/main/main_app_bar.dart';
import 'package:movie_app_flutter/pages/main/main_bottom_bar.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';

final pageProvider = StateProvider((ref) => AppPage.MOVIE);

enum AppPage { MOVIE, TV_SHOW, PROFILE }

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MovieColors.pageGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainAppBar(),
        body: _MainPage(),
        bottomNavigationBar: MainBottomBar(),
      ),
    );
  }
}

class _MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(pageProvider).state;
    if (currentPage == AppPage.MOVIE) {
      return MoviePage();
    } else if (currentPage == AppPage.TV_SHOW) {
      return TvShowPage();
    } else {
      return ProfilePage();
    }
  }
}

class TvShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TvShow"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Profile"),
    );
  }
}
