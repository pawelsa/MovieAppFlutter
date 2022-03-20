import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
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

    ref.listen(getPopularMoviesProvider(1), (_, AsyncValue<Result> result) {
      debugPrint("MoviePage.build: ${result.asData}");
      if (result.asData?.value is ErrorResult) {
        final messenger = (String msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
        result.asData?.value.whenOrNull(error: (cause) {
          return cause.when(
            noInternet: () => messenger("Lost connection when loading popular movies"),
            databaseSave: () => messenger("We messed something up and could not update movies"),
            unknown: () => messenger("Unexpected error happen when loading popular movies"),
          );
        });
      }
    });
    ref.listen(getUpcomingMoviesProvider(1), (_, AsyncValue<Result> result) {
      debugPrint("MoviePage.build: ${result.asData}");
      if (result.asData?.value is ErrorResult) {
        final messenger = (String msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
        result.asData?.value.whenOrNull(error: (cause) {
          return cause.when(
            noInternet: () => messenger("Lost connection when loading upcoming movies"),
            databaseSave: () => messenger("We messed something up and could not update movies"),
            unknown: () => messenger("Unexpected error happen when loading upcoming movies"),
          );
        });
      }
    });

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      firstTabProvider: observePopularMoviesProvider,
      secondTabProvider: observeUpcomingMoviesProvider,
      contentDetailProvider: movieDetailProvider,
      tabs: tabs,
    );
  }
}
