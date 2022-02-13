import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/main/main_app_bar.dart';
import 'package:movie_app_flutter/pages/main/main_bottom_bar.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/pages/tv_show/tv_show_page.dart';
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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: MainAppBar(),
          body: _MainPage(),
          bottomNavigationBar: MainBottomBar(),
        ),
      ),
    );
  }
}

class _MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageProvider);
    if (currentPage == AppPage.MOVIE) {
      return MoviePage();
    } else if (currentPage == AppPage.TV_SHOW) {
      return TvShowPage();
    } else {
      return ProfilePage();
    }
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Container(
                width: 150,
                height: 150,
                foregroundDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000)),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.black54,
                  size: 200,
                ),
              ),
            ),
            Text(
              "Josh Smith",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Bought tickets",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 0.3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Favourite movies",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
