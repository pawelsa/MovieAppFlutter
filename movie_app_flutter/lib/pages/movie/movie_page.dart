import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _pageProvider = StateProvider((ref) => 0);

class MoviePage extends ConsumerWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(_pageProvider).state;
    // _pageController.animateToPage(currentPage, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    return Column(
      children: [
        Row(
          children: [
            Text("Tab1"),
            Text("Tab2"),
          ],
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) => context.read(_pageProvider).state = page,
            children: [
              Center(
                child: Text("Page1"),
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
