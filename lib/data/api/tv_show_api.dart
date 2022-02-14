import 'dart:convert';

import 'package:movie_app_flutter/data/api/api.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';
import 'package:movie_app_flutter/secret/secret.dart';

class TvShowApi with Api {
  static const baseUrl = "https://api.themoviedb.org/3/tv/";

  Future<Response> getPopular(int page) => get(
        Uri.parse(
            "${baseUrl}popular?language=en-US&page=1&api_key=${Secret.apiKey}"),
        (body) => ContentListResponse.fromJson(jsonDecode(body)),
      );

  Future<Response> getTopRated(int page) => get(
        Uri.parse(
            "${baseUrl}top_rated?language=en-US&page=1&api_key=${Secret.apiKey}"),
        (body) => ContentListResponse.fromJson(jsonDecode(body)),
      );

  Future<Response> getCredits(int tvShowId) {
    return get(
      Uri.parse(
          "$baseUrl$tvShowId/credits?language=en-US&api_key=${Secret.apiKey}"),
      (body) => ApiCredits.fromJson(jsonDecode(body)),
    );
  }
}
