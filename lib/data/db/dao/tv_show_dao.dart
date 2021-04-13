import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';

@dao
abstract class TvShowDao {
  @Insert()
  Future<void> insertAll(List<ContentDb> content);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertMoviePersons(List<ContentPersonDb> moviePeople);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insert(ContentDb dbContent);

  @Insert()
  Future<void> insertTvShow(TvShowDb dbTvShow);

  @Query(
      "SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 1 ORDER BY t.`order`")
  Future<List<ContentDb>> findAllPopular();

  @Query(
      "SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 1 ORDER BY t.`order`")
  Future<List<ContentDb>> findAllTopRated();
}
