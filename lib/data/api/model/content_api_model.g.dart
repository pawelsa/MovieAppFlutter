// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentListResponse _$$_ContentListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ContentListResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => const ContentResponseConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$_ContentListResponseToJson(
        _$_ContentListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results
          .map(const ContentResponseConverter().toJson)
          .toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

_$_MovieResponse _$$_MovieResponseFromJson(Map<String, dynamic> json) =>
    _$_MovieResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_MovieResponseToJson(_$_MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'vote_average': instance.voteAverage,
      'runtimeType': instance.$type,
    };

_$_TvShowResponse _$$_TvShowResponseFromJson(Map<String, dynamic> json) =>
    _$_TvShowResponse(
      id: json['id'] as int,
      title: json['name'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      firstAirDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_TvShowResponseToJson(_$_TvShowResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'release_date': instance.firstAirDate?.toIso8601String(),
      'vote_average': instance.voteAverage,
      'runtimeType': instance.$type,
    };
