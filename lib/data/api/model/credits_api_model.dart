import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';

part 'credits_api_model.freezed.dart';

part 'credits_api_model.g.dart';

@freezed
class ApiCredits with _$ApiCredits implements SuccessfulResponse {
  @JsonSerializable(explicitToJson: true)
  factory ApiCredits({
    required int id,
    @ApiPersonConverter() required List<ApiPerson> cast,
    @ApiPersonConverter() required List<ApiPerson> crew,
  }) = _ApiCredits;

  factory ApiCredits.fromJson(Map<String, dynamic> json) =>
      _$ApiCreditsFromJson(json);
}

@freezed
class ApiPerson with _$ApiPerson {
  @JsonSerializable(explicitToJson: true)
  factory ApiPerson({
    required int id,
    required String name,
    @JsonKey(name: "profile_path") required String? profilePath,
    required String? character,
    required int? order,
    required String? department,
    required String? job,
    @JsonKey(name: "credit_id") required String creditId,
  }) = _ApiPerson;

  @JsonSerializable(explicitToJson: true)
  factory ApiPerson.empty([
    @Default(-1) int id,
    @Default("Unknown") String name,
    @Default(null) @JsonKey(name: "profile_path") String? profilePath,
    @Default(null) String? character,
    @Default(-1) int? order,
    @Default(null) String? department,
    @Default(null) String? job,
    @Default("") @JsonKey(name: "credit_id") String creditId,
  ]) = _ApiPersonEmpty;

  factory ApiPerson.fromJson(Map<String, dynamic> json) =>
      _$ApiPersonFromJson(json);
}

class ApiPersonConverter
    implements JsonConverter<ApiPerson, Map<String, dynamic>> {
  const ApiPersonConverter();

  @override
  ApiPerson fromJson(Map<String, dynamic> json) {
    return _$_ApiPerson.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ApiPerson object) {
    return object.toJson();
  }
}
