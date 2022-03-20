import 'dart:convert';

import 'package:movie_app_flutter/data/api/api.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';

class TvShowApi with Api {
  Future<Response> getPopular(int page) => get(
        uri: Uri.parse("${Api.baseUrl}tv/popular?language=en-US&page=$page"),
        mapper: (body) => ContentListResponse.fromJson(jsonDecode(body)),
      );

  Future<Response> getTopRated(int page) => get(
    uri: Uri.parse("${Api.baseUrl}tv/top_rated?language=en-US&page=$page"),
        mapper: (body) => ContentListResponse.fromJson(jsonDecode(body)),
      );

  Future<Response> getCredits(int tvShowId) => get(
    uri: Uri.parse("${Api.baseUrl}tv/$tvShowId/credits?language=en-US"),
        mapper: (body) => ApiCredits.fromJson(jsonDecode(body)),
      );
}
