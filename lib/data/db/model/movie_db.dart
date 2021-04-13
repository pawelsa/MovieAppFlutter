import 'package:floor/floor.dart';

@Entity(tableName: 'movies')
class ContentDb {
  @primaryKey
  final String id;
  @ColumnInfo(name: 'is_movie')
  final bool isMovie;
  final String title;
  final double grade;
  final String director;
  final String stars;
  @ColumnInfo(name: 'poster_path')
  final String? posterPath;
  @ColumnInfo(name: 'backdrop_path')
  final String? backdropPath;
  final String overview;

  ContentDb(
    this.id,
    this.isMovie,
    this.title,
    this.grade,
    this.director,
    this.stars,
    this.posterPath,
    this.backdropPath,
    this.overview,
  );
}
