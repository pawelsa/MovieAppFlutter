// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentListResponse _$ContentListResponseFromJson(Map<String, dynamic> json) {
  return _ContentListResponse.fromJson(json);
}

/// @nodoc
class _$ContentListResponseTearOff {
  const _$ContentListResponseTearOff();

  _ContentListResponse call(
      {required int page,
      @ContentResponseConverter() required List<ContentResponse> results,
      @JsonKey(name: "total_pages") required int totalPages,
      @JsonKey(name: "total_results") required int totalResults}) {
    return _ContentListResponse(
      page: page,
      results: results,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }

  ContentListResponse fromJson(Map<String, Object?> json) {
    return ContentListResponse.fromJson(json);
  }
}

/// @nodoc
const $ContentListResponse = _$ContentListResponseTearOff();

/// @nodoc
mixin _$ContentListResponse {
  int get page => throw _privateConstructorUsedError;
  @ContentResponseConverter()
  List<ContentResponse> get results => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "total_results")
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentListResponseCopyWith<ContentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentListResponseCopyWith<$Res> {
  factory $ContentListResponseCopyWith(
          ContentListResponse value, $Res Function(ContentListResponse) then) =
      _$ContentListResponseCopyWithImpl<$Res>;
  $Res call(
      {int page,
      @ContentResponseConverter() List<ContentResponse> results,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults});
}

/// @nodoc
class _$ContentListResponseCopyWithImpl<$Res>
    implements $ContentListResponseCopyWith<$Res> {
  _$ContentListResponseCopyWithImpl(this._value, this._then);

  final ContentListResponse _value;
  // ignore: unused_field
  final $Res Function(ContentListResponse) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ContentListResponseCopyWith<$Res>
    implements $ContentListResponseCopyWith<$Res> {
  factory _$ContentListResponseCopyWith(_ContentListResponse value,
          $Res Function(_ContentListResponse) then) =
      __$ContentListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      @ContentResponseConverter() List<ContentResponse> results,
      @JsonKey(name: "total_pages") int totalPages,
      @JsonKey(name: "total_results") int totalResults});
}

/// @nodoc
class __$ContentListResponseCopyWithImpl<$Res>
    extends _$ContentListResponseCopyWithImpl<$Res>
    implements _$ContentListResponseCopyWith<$Res> {
  __$ContentListResponseCopyWithImpl(
      _ContentListResponse _value, $Res Function(_ContentListResponse) _then)
      : super(_value, (v) => _then(v as _ContentListResponse));

  @override
  _ContentListResponse get _value => super._value as _ContentListResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_ContentListResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
@Implements<SuccessfulResponse>()
class _$_ContentListResponse implements _ContentListResponse {
  _$_ContentListResponse(
      {required this.page,
      @ContentResponseConverter() required this.results,
      @JsonKey(name: "total_pages") required this.totalPages,
      @JsonKey(name: "total_results") required this.totalResults});

  factory _$_ContentListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ContentListResponseFromJson(json);

  @override
  final int page;
  @override
  @ContentResponseConverter()
  final List<ContentResponse> results;
  @override
  @JsonKey(name: "total_pages")
  final int totalPages;
  @override
  @JsonKey(name: "total_results")
  final int totalResults;

  @override
  String toString() {
    return 'ContentListResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentListResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.results, results) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(results),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(totalResults));

  @JsonKey(ignore: true)
  @override
  _$ContentListResponseCopyWith<_ContentListResponse> get copyWith =>
      __$ContentListResponseCopyWithImpl<_ContentListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentListResponseToJson(this);
  }
}

abstract class _ContentListResponse
    implements ContentListResponse, SuccessfulResponse {
  factory _ContentListResponse(
          {required int page,
          @ContentResponseConverter() required List<ContentResponse> results,
          @JsonKey(name: "total_pages") required int totalPages,
          @JsonKey(name: "total_results") required int totalResults}) =
      _$_ContentListResponse;

  factory _ContentListResponse.fromJson(Map<String, dynamic> json) =
      _$_ContentListResponse.fromJson;

  @override
  int get page;
  @override
  @ContentResponseConverter()
  List<ContentResponse> get results;
  @override
  @JsonKey(name: "total_pages")
  int get totalPages;
  @override
  @JsonKey(name: "total_results")
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$ContentListResponseCopyWith<_ContentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentResponse _$ContentResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fromMovie':
      return _MovieResponse.fromJson(json);
    case 'fromTvShow':
      return _TvShowResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ContentResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$ContentResponseTearOff {
  const _$ContentResponseTearOff();

  _MovieResponse fromMovie(
      {required int id,
      required String title,
      @JsonKey(name: "poster_path") required String? posterPath,
      @JsonKey(name: "backdrop_path") required String? backdropPath,
      @JsonKey(name: "genre_ids") required List<int> genreIds,
      required String overview,
      required double popularity,
      @JsonKey(name: "first_air_date") required DateTime? firstAirDate,
      @JsonKey(name: "vote_average") required double voteAverage}) {
    return _MovieResponse(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      genreIds: genreIds,
      overview: overview,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
    );
  }

  _TvShowResponse fromTvShow(
      {required int id,
      @JsonKey(name: "name") required String title,
      @JsonKey(name: "poster_path") required String? posterPath,
      @JsonKey(name: "backdrop_path") required String? backdropPath,
      @JsonKey(name: "genre_ids") required List<int> genreIds,
      required String overview,
      required double popularity,
      @JsonKey(name: "release_date") required DateTime? firstAirDate,
      @JsonKey(name: "vote_average") required double voteAverage}) {
    return _TvShowResponse(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      genreIds: genreIds,
      overview: overview,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
    );
  }

  ContentResponse fromJson(Map<String, Object?> json) {
    return ContentResponse.fromJson(json);
  }
}

/// @nodoc
const $ContentResponse = _$ContentResponseTearOff();

/// @nodoc
mixin _$ContentResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: "backdrop_path")
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: "genre_ids")
  List<int> get genreIds => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: "first_air_date")
  DateTime? get firstAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_average")
  double get voteAverage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromMovie,
    required TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromTvShow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieResponse value) fromMovie,
    required TResult Function(_TvShowResponse value) fromTvShow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentResponseCopyWith<ContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResponseCopyWith<$Res> {
  factory $ContentResponseCopyWith(
          ContentResponse value, $Res Function(ContentResponse) then) =
      _$ContentResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      @JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "backdrop_path") String? backdropPath,
      @JsonKey(name: "genre_ids") List<int> genreIds,
      String overview,
      double popularity,
      @JsonKey(name: "first_air_date") DateTime? firstAirDate,
      @JsonKey(name: "vote_average") double voteAverage});
}

/// @nodoc
class _$ContentResponseCopyWithImpl<$Res>
    implements $ContentResponseCopyWith<$Res> {
  _$ContentResponseCopyWithImpl(this._value, this._then);

  final ContentResponse _value;
  // ignore: unused_field
  final $Res Function(ContentResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: firstAirDate == freezed
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$MovieResponseCopyWith<$Res>
    implements $ContentResponseCopyWith<$Res> {
  factory _$MovieResponseCopyWith(
          _MovieResponse value, $Res Function(_MovieResponse) then) =
      __$MovieResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      @JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "backdrop_path") String? backdropPath,
      @JsonKey(name: "genre_ids") List<int> genreIds,
      String overview,
      double popularity,
      @JsonKey(name: "first_air_date") DateTime? firstAirDate,
      @JsonKey(name: "vote_average") double voteAverage});
}

/// @nodoc
class __$MovieResponseCopyWithImpl<$Res>
    extends _$ContentResponseCopyWithImpl<$Res>
    implements _$MovieResponseCopyWith<$Res> {
  __$MovieResponseCopyWithImpl(
      _MovieResponse _value, $Res Function(_MovieResponse) _then)
      : super(_value, (v) => _then(v as _MovieResponse));

  @override
  _MovieResponse get _value => super._value as _MovieResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_MovieResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: firstAirDate == freezed
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_MovieResponse implements _MovieResponse {
  _$_MovieResponse(
      {required this.id,
      required this.title,
      @JsonKey(name: "poster_path") required this.posterPath,
      @JsonKey(name: "backdrop_path") required this.backdropPath,
      @JsonKey(name: "genre_ids") required this.genreIds,
      required this.overview,
      required this.popularity,
      @JsonKey(name: "first_air_date") required this.firstAirDate,
      @JsonKey(name: "vote_average") required this.voteAverage,
      String? $type})
      : $type = $type ?? 'fromMovie';

  factory _$_MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MovieResponseFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @override
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @override
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: "first_air_date")
  final DateTime? firstAirDate;
  @override
  @JsonKey(name: "vote_average")
  final double voteAverage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContentResponse.fromMovie(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, genreIds: $genreIds, overview: $overview, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.backdropPath, backdropPath) &&
            const DeepCollectionEquality().equals(other.genreIds, genreIds) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.firstAirDate, firstAirDate) &&
            const DeepCollectionEquality()
                .equals(other.voteAverage, voteAverage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(backdropPath),
      const DeepCollectionEquality().hash(genreIds),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(popularity),
      const DeepCollectionEquality().hash(firstAirDate),
      const DeepCollectionEquality().hash(voteAverage));

  @JsonKey(ignore: true)
  @override
  _$MovieResponseCopyWith<_MovieResponse> get copyWith =>
      __$MovieResponseCopyWithImpl<_MovieResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromMovie,
    required TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromTvShow,
  }) {
    return fromMovie(id, title, posterPath, backdropPath, genreIds, overview,
        popularity, firstAirDate, voteAverage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
  }) {
    return fromMovie?.call(id, title, posterPath, backdropPath, genreIds,
        overview, popularity, firstAirDate, voteAverage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
    required TResult orElse(),
  }) {
    if (fromMovie != null) {
      return fromMovie(id, title, posterPath, backdropPath, genreIds, overview,
          popularity, firstAirDate, voteAverage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieResponse value) fromMovie,
    required TResult Function(_TvShowResponse value) fromTvShow,
  }) {
    return fromMovie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
  }) {
    return fromMovie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
    required TResult orElse(),
  }) {
    if (fromMovie != null) {
      return fromMovie(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieResponseToJson(this);
  }
}

abstract class _MovieResponse implements ContentResponse {
  factory _MovieResponse(
          {required int id,
          required String title,
          @JsonKey(name: "poster_path") required String? posterPath,
          @JsonKey(name: "backdrop_path") required String? backdropPath,
          @JsonKey(name: "genre_ids") required List<int> genreIds,
          required String overview,
          required double popularity,
          @JsonKey(name: "first_air_date") required DateTime? firstAirDate,
          @JsonKey(name: "vote_average") required double voteAverage}) =
      _$_MovieResponse;

  factory _MovieResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieResponse.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(name: "backdrop_path")
  String? get backdropPath;
  @override
  @JsonKey(name: "genre_ids")
  List<int> get genreIds;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: "first_air_date")
  DateTime? get firstAirDate;
  @override
  @JsonKey(name: "vote_average")
  double get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$MovieResponseCopyWith<_MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TvShowResponseCopyWith<$Res>
    implements $ContentResponseCopyWith<$Res> {
  factory _$TvShowResponseCopyWith(
          _TvShowResponse value, $Res Function(_TvShowResponse) then) =
      __$TvShowResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "name") String title,
      @JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "backdrop_path") String? backdropPath,
      @JsonKey(name: "genre_ids") List<int> genreIds,
      String overview,
      double popularity,
      @JsonKey(name: "release_date") DateTime? firstAirDate,
      @JsonKey(name: "vote_average") double voteAverage});
}

/// @nodoc
class __$TvShowResponseCopyWithImpl<$Res>
    extends _$ContentResponseCopyWithImpl<$Res>
    implements _$TvShowResponseCopyWith<$Res> {
  __$TvShowResponseCopyWithImpl(
      _TvShowResponse _value, $Res Function(_TvShowResponse) _then)
      : super(_value, (v) => _then(v as _TvShowResponse));

  @override
  _TvShowResponse get _value => super._value as _TvShowResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_TvShowResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: firstAirDate == freezed
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TvShowResponse implements _TvShowResponse {
  _$_TvShowResponse(
      {required this.id,
      @JsonKey(name: "name") required this.title,
      @JsonKey(name: "poster_path") required this.posterPath,
      @JsonKey(name: "backdrop_path") required this.backdropPath,
      @JsonKey(name: "genre_ids") required this.genreIds,
      required this.overview,
      required this.popularity,
      @JsonKey(name: "release_date") required this.firstAirDate,
      @JsonKey(name: "vote_average") required this.voteAverage,
      String? $type})
      : $type = $type ?? 'fromTvShow';

  factory _$_TvShowResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TvShowResponseFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "name")
  final String title;
  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @override
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @override
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: "release_date")
  final DateTime? firstAirDate;
  @override
  @JsonKey(name: "vote_average")
  final double voteAverage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ContentResponse.fromTvShow(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, genreIds: $genreIds, overview: $overview, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvShowResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.backdropPath, backdropPath) &&
            const DeepCollectionEquality().equals(other.genreIds, genreIds) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.firstAirDate, firstAirDate) &&
            const DeepCollectionEquality()
                .equals(other.voteAverage, voteAverage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(backdropPath),
      const DeepCollectionEquality().hash(genreIds),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(popularity),
      const DeepCollectionEquality().hash(firstAirDate),
      const DeepCollectionEquality().hash(voteAverage));

  @JsonKey(ignore: true)
  @override
  _$TvShowResponseCopyWith<_TvShowResponse> get copyWith =>
      __$TvShowResponseCopyWithImpl<_TvShowResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromMovie,
    required TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)
        fromTvShow,
  }) {
    return fromTvShow(id, title, posterPath, backdropPath, genreIds, overview,
        popularity, firstAirDate, voteAverage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
  }) {
    return fromTvShow?.call(id, title, posterPath, backdropPath, genreIds,
        overview, popularity, firstAirDate, voteAverage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "first_air_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromMovie,
    TResult Function(
            int id,
            @JsonKey(name: "name") String title,
            @JsonKey(name: "poster_path") String? posterPath,
            @JsonKey(name: "backdrop_path") String? backdropPath,
            @JsonKey(name: "genre_ids") List<int> genreIds,
            String overview,
            double popularity,
            @JsonKey(name: "release_date") DateTime? firstAirDate,
            @JsonKey(name: "vote_average") double voteAverage)?
        fromTvShow,
    required TResult orElse(),
  }) {
    if (fromTvShow != null) {
      return fromTvShow(id, title, posterPath, backdropPath, genreIds, overview,
          popularity, firstAirDate, voteAverage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieResponse value) fromMovie,
    required TResult Function(_TvShowResponse value) fromTvShow,
  }) {
    return fromTvShow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
  }) {
    return fromTvShow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieResponse value)? fromMovie,
    TResult Function(_TvShowResponse value)? fromTvShow,
    required TResult orElse(),
  }) {
    if (fromTvShow != null) {
      return fromTvShow(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TvShowResponseToJson(this);
  }
}

abstract class _TvShowResponse implements ContentResponse {
  factory _TvShowResponse(
          {required int id,
          @JsonKey(name: "name") required String title,
          @JsonKey(name: "poster_path") required String? posterPath,
          @JsonKey(name: "backdrop_path") required String? backdropPath,
          @JsonKey(name: "genre_ids") required List<int> genreIds,
          required String overview,
          required double popularity,
          @JsonKey(name: "release_date") required DateTime? firstAirDate,
          @JsonKey(name: "vote_average") required double voteAverage}) =
      _$_TvShowResponse;

  factory _TvShowResponse.fromJson(Map<String, dynamic> json) =
      _$_TvShowResponse.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "name")
  String get title;
  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(name: "backdrop_path")
  String? get backdropPath;
  @override
  @JsonKey(name: "genre_ids")
  List<int> get genreIds;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: "release_date")
  DateTime? get firstAirDate;
  @override
  @JsonKey(name: "vote_average")
  double get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$TvShowResponseCopyWith<_TvShowResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
