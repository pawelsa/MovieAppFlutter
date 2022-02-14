import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/data/api/model/response_model.dart';

abstract class Api {
  Future<Response> get(Uri uri, Response Function(String body) mapper) {
    return http.get(uri).then((value) => mapper(value.body));
  }
}
