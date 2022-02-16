import 'dart:convert';

import 'package:movie_app_flutter/data/api/api.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';

class MovieApi with Api {
  Future<Response> getPopular(int page) => get(
        uri: (Uri.parse("${Api.baseUrl}popular?language=en-US&page=$page")),
        mapper: (value) => ContentListResponse.fromJson(jsonDecode(value)),
      );

  Future<Response> getUpcoming(int page) => get(
        uri: (Uri.parse("${Api.baseUrl}upcoming?language=en-US&page=$page")),
        mapper: (body) => ContentListResponse.fromJson(jsonDecode(body)),
      );

  Future<Response> getCredits(int movieId) => get(
        uri: Uri.parse("${Api.baseUrl}$movieId/credits?language=en-US"),
        mapper: (body) => ApiCredits.fromJson(jsonDecode(body)),
      );
}
