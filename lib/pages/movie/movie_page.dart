import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/widgets/card_item.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

final _pageProvider = StateProvider((ref) => 0);

class ContentData {
  final String title;
  final String grade;
  final String director;
  final String stars;
  final String posterPath;

  ContentData(
      this.title, this.grade, this.director, this.stars, this.posterPath);
}

class MoviePage extends ConsumerWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(_pageProvider).state;
    // _pageController.animateToPage(currentPage, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);

    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            top: 20.0,
          ),
          child:
              MovieTabPager(currentPage: currentPage, tabs: ["Tab1", "Tab2"]),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) => context.read(_pageProvider).state = page,
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardItem(
                    content: ContentData(
                        "Title", "8.0", "Michael", "Michael / Lopez", ""),
                    width: size.width,
                  );
                },
              ),
              Center(
                child: Text("Page2"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
