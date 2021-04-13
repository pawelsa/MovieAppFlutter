import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/secret/secret.dart';

class MovieApi {
  static const baseUrl = "https://api.themoviedb.org/3/movie/";

  Future<PageContent> getPopular(int page) {
    return http
        .get(
          (Uri.parse(
            "${baseUrl}popular?api_key=${Secret.apiKey}&language=en-US&page=$page",
          )),
        )
        .then(
          (value) => apiMovieContentFromJson(value.body),
        );
  }

  Future<PageContent> getUpcoming(int page) {
    return http
        .get(
          (Uri.parse(
              "${baseUrl}upcoming?api_key=${Secret.apiKey}&language=en-US&page=$page")),
        )
        .then(
          (value) => apiMovieContentFromJson(value.body),
        );
  }

  Future<ApiCredits> getCredits(int movieId) {
    return http
        .get(Uri.parse(
            "$baseUrl$movieId/credits?language=en-US&api_key=${Secret.apiKey}"))
        .then((value) => apiCreditsFromJson(value.body));
  }
}
