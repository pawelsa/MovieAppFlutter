import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/data/api/model/response_model.dart';
import 'package:movie_app_flutter/secret/secret.dart';

abstract class Api {
  static const baseUrl = "https://api.themoviedb.org/3/movie/";

  Future<Response> get({
    required Uri uri,
    required Response Function(String body) mapper,
    Map<String, String>? headers,
  }) {
    final newQueryParameters = Map<String, dynamic>.from(uri.queryParameters);
    newQueryParameters["api_key"] = Secret.apiKey;
    uri = uri.replace(queryParameters: newQueryParameters);

    return http.get(uri, headers: headers).then((response) {
      switch (response.statusCode) {
        case 200:
          return mapper(response.body);
        case 400:
          return BadRequestResponse();
        case 401:
        case 403:
          return UnAuthorizedResponse();
        case 404:
          return NotFoundResponse();
        default:
          return NotHandledResponse();
      }
    });
  }
}
