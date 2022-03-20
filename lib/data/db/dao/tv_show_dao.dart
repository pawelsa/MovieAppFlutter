import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/dao/content_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';

@dao
abstract class TvShowDao extends ContentDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTvShow(TvShowDb dbTvShow);

  @Query("SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 1 ORDER BY t.`order`")
  Stream<List<ContentDb>> observeAllPopular();

  @Query("SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 0 ORDER BY t.`order`")
  Stream<List<ContentDb>> observeAllTopRated();

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = :contentId AND c.credit_id = p.credit_id AND c.is_cast = 0 AND c.is_movie = 0")
  Future<List<PersonDb>> findAllCrew(int contentId);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id AND c.credit_id = p.credit_id WHERE c.content_id = :contentId AND c.is_cast = 1 AND c.is_movie = 0 ORDER BY c.`order`")
  Future<List<PersonDb>> findAllCast(int contentId);

  @Query("SELECT * FROM content WHERE is_movie = 0 AND id = :id")
  Future<ContentDb?> findById(int id);
}
