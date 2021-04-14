import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/dao/content_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';

@dao
abstract class MovieDao extends ContentDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertMovie(MovieDb movie);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id AND c.credit_id = p.credit_id WHERE c.is_movie = 1 AND c.content_id = :contentId AND c.is_cast = 1 ORDER BY c.`order`")
  Future<List<PersonDb>> findAllCast(int contentId);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id AND c.credit_id = p.credit_id WHERE c.content_id = :contentId AND c.is_cast = 0 AND c.is_movie = 1")
  Future<List<PersonDb>> findAllCrew(int contentId);

  @Query(
      "SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`")
  Future<List<ContentDb>> findAllPopular();

  @Query(
      "SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`")
  Future<List<ContentDb>> findAllUpcoming();

  @Query("SELECT * FROM content WHERE is_movie = 1 AND id = :id")
  Future<ContentDb?> findById(int id);
}
