import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/data/view/person.dart';

class ContentData {
  final int id;
  final String title;
  final double grade;
  final String director;
  final String stars;
  final String? posterPath;

  ContentData(this.id, this.title, this.grade, this.director, this.stars,
      this.posterPath);

  ContentDetailData addDetail({
    required String? backdropPath,
    required String overview,
    required bool isCollected,
    required List<Person> cast,
    required List<Person> crew,
  }) {
    return ContentDetailData(
      id: id,
      title: title,
      grade: grade,
      director: director,
      stars: stars,
      posterPath: posterPath,
      backdropPath: backdropPath,
      overview: overview,
      isCollected: isCollected,
      cast: cast,
      crew: crew,
    );
  }
}
