import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_flutter/data/api/model/response_model.dart';

part 'content_api_model.freezed.dart';

part 'content_api_model.g.dart';

@Freezed(
  maybeMap: false,
  maybeWhen: false,
)
class ContentListResponse
    with _$ContentListResponse
    implements SuccessfulResponse {
  @JsonSerializable(explicitToJson: true)
  @Implements<SuccessfulResponse>()
  factory ContentListResponse({
    required int page,
    @ContentResponseConverter() required List<ContentResponse> results,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _ContentListResponse;

  @Implements<SuccessfulResponse>()
  factory ContentListResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentListResponseFromJson(json);
}

@freezed
class ContentResponse with _$ContentResponse {
  @JsonSerializable(explicitToJson: true)
  factory ContentResponse.fromMovie({
    required int id,
    required String title,
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "backdrop_path") required String? backdropPath,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    required String overview,
    required double popularity,
    @JsonKey(name: "first_air_date") required DateTime? firstAirDate,
    @JsonKey(name: "vote_average") required double voteAverage,
  }) = _MovieResponse;

  @JsonSerializable(explicitToJson: true)
  factory ContentResponse.fromTvShow({
    required int id,
    @JsonKey(name: "name") required String title,
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "backdrop_path") required String? backdropPath,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    required String overview,
    required double popularity,
    @JsonKey(name: "release_date") required DateTime? firstAirDate,
    @JsonKey(name: "vote_average") required double voteAverage,
  }) = _TvShowResponse;

  factory ContentResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentResponseFromJson(json);
}

class ContentResponseConverter
    implements JsonConverter<ContentResponse, Map<String, dynamic>> {
  const ContentResponseConverter();

  @override
  ContentResponse fromJson(Map<String, dynamic> json) {
    if (json.containsKey("name")) {
      return _$_TvShowResponse.fromJson(json);
    } else {
      return _$_MovieResponse.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(ContentResponse object) {
    return <String, dynamic>{};
  }
}
