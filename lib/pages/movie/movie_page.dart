import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/use_case/get_movie_details.dart';
import 'package:movie_app_flutter/data/use_case/get_movies.dart';
import 'package:movie_app_flutter/data/use_case/observe_movies.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider<int>((ref) => 0);

class MoviePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = <String>[
      context.text.moviesTabNowPopular,
      context.text.moviesTabTheUpcoming,
    ];

    ref.watch(getPopularMoviesProvider(1));
    ref.watch(getUpcomingMoviesProvider(1));

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      firstTabProvider: observePopularMoviesProvider,
      secondTabProvider: observeUpcomingMoviesProvider,
      contentDetailProvider: movieDetailProvider,
      tabs: tabs,
    );
  }
}
