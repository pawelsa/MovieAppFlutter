import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/person.dart';

class ContentDetailData extends ContentData {
  final String? backdropPath;
  final String overview;
  final bool isCollected;
  final List<Person> cast;
  final List<Person> crew;

  ContentDetailData({
    required String title,
    required double grade,
    required String director,
    required String stars,
    required String? posterPath,
    required this.backdropPath,
    required this.overview,
    required this.isCollected,
    required this.cast,
    required this.crew,
  }) : super(title, grade, director, stars, posterPath);
}
