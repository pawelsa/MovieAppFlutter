import 'dart:convert';

PageContent apiTvContentFromJson(String str) =>
    PageContent.fromTvJson(json.decode(str));

PageContent apiMovieContentFromJson(String str) =>
    PageContent.fromMovieJson(json.decode(str));

class PageContent {
  PageContent({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<ApiContent> results;
  final int totalPages;
  final int totalResults;

  factory PageContent.fromTvJson(Map<String, dynamic> json) => PageContent(
        page: json["page"],
        results: List<ApiContent>.from(
            json["results"].map((x) => ApiContent.fromTvJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  factory PageContent.fromMovieJson(Map<String, dynamic> json) => PageContent(
        page: json["page"],
        results: List<ApiContent>.from(
            json["results"].map((x) => ApiContent.fromMovieJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class ApiContent {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final List<int> genreIds;
  final String overview;
  final double popularity;
  final DateTime firstAirDate;
  final double voteAverage;

  ApiContent({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.title,
    required this.voteAverage,
  });

  factory ApiContent.fromTvJson(Map<String, dynamic> json) => ApiContent(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        title: json["name"],
        voteAverage: json["vote_average"].toDouble(),
      );

  factory ApiContent.fromMovieJson(Map<String, dynamic> json) => ApiContent(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
