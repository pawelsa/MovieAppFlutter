import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/main.dart';
import 'package:movie_app_flutter/pages/main/main_page.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(
              builder: (context, watch, child) {
                final currentPage = watch(pageProvider).state;
                final title = currentPage == AppPage.MOVIE
                    ? context.text.appBarMovies
                    : currentPage == AppPage.TV_SHOW
                        ? context.text.appBarTvShows
                        : context.text.appBarProfile;
                return Text(
                  title,
                  style: TextStyle(fontFamily: fontEthnocentric, fontSize: 30),
                );
              },
            ),
            IconButton(
              splashRadius: 23,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
