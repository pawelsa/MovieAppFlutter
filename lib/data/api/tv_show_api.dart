import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/secret/secret.dart';

class TvShowApi {
  static const baseUrl = "https://api.themoviedb.org/3/tv/";

  Future<PageContent> getPopular(int page) {
    return http
        .get(Uri.parse(
            "${baseUrl}popular?language=en-US&page=1&api_key=${Secret.apiKey}"))
        .then((value) => apiTvContentFromJson(value.body));
  }

  Future<PageContent> getTopRated(int page) {
    return http
        .get(Uri.parse(
            "${baseUrl}top_rated?language=en-US&page=1&api_key=${Secret.apiKey}"))
        .then((value) => apiTvContentFromJson(value.body));
  }

  Future<ApiCredits> getCredits(int tvShowId) {
    return http
        .get(Uri.parse(
            "$baseUrl$tvShowId/credits?language=en-US&api_key=${Secret.apiKey}"))
        .then((value) => apiCreditsFromJson(value.body));
  }
}
