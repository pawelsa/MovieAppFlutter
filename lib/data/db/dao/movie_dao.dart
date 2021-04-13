import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';

@dao
abstract class ContentDao {
  @Insert()
  Future<void> insertAll(List<ContentDb> content);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertMoviePersons(List<ContentPersonDb> moviePeople);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insert(ContentDb dbContent);

  @Insert()
  Future<void> insertMovie(MovieDb movie);

  @Query(
      "SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`")
  Future<List<ContentDb>> findAllPopular();

  @Query(
      "SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`")
  Future<List<ContentDb>> findAllUpcoming();
}
