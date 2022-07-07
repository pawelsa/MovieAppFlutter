import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/data/api/model/response_model.dart';
import 'package:movie_app_flutter/secret/secret.dart';

abstract class Api {
  static const baseUrl = "https://api.themoviedb.org/3/";

  Future<Response> get({
    required Uri uri,
    required Response Function(String body) mapper,
    Map<String, String>? headers,
  }) {
    uri = _prepareUri(uri);

    return http
        .get(uri, headers: headers)
        .then((response) => _handleResponse(response, mapper), onError: _handleOnError);
  }

  ErrorResponse _handleOnError(e) {
    if (e is SocketException) {
      return NoInternetResponse();
    } else if (e is TimeoutException) {
      return TimeoutResponse();
    }
    return GeneralErrorResponse();
  }

  Uri _prepareUri(Uri uri) {
    final newQueryParameters = Map<String, dynamic>.from(uri.queryParameters);
    newQueryParameters["api_key"] = Secret.apiKey;
    uri = uri.replace(queryParameters: newQueryParameters);
    return uri;
  }

  Response _handleResponse(http.Response response, Response Function(String body) mapper) {
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
  }
}
