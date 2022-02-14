import 'dart:convert';

import 'package:movie_app_flutter/data/api/api.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';
import 'package:movie_app_flutter/secret/secret.dart';

class MovieApi with Api {
  static const baseUrl = "https://api.themoviedb.org/3/movie/";

  Future<Response> getPopular(int page) {
    return get(
        (Uri.parse(
          "${baseUrl}popular?api_key=${Secret.apiKey}&language=en-US&page=$page",
        )),
        (value) => ContentListResponse.fromJson(jsonDecode(value)));
  }

  Future<Response> getUpcoming(int page) {
    return get(
        (Uri.parse(
            "${baseUrl}upcoming?api_key=${Secret.apiKey}&language=en-US&page=$page")),
        (body) => ContentListResponse.fromJson(jsonDecode(body)));
  }

  Future<Response> getCredits(int movieId) {
    return get(
      Uri.parse(
          "$baseUrl$movieId/credits?language=en-US&api_key=${Secret.apiKey}"),
      (body) => ApiCredits.fromJson(jsonDecode(body)),
    );
  }
}
