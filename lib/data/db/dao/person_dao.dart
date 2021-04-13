import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';

@dao
abstract class PeopleDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertPeople(List<PersonDb> people);

  // TODO handle multiple roles of people in repo
  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.is_movie = 1 AND c.content_id = :contentId AND c.is_cast = 1 ORDER BY c.`order`")
  Future<List<PersonDb>> findAllCastForMovie(int contentId);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = :contentId AND c.is_cast = 0 AND c.is_movie = 1")
  Future<List<PersonDb>> findAllCrewForMovie(int contentId);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = :contentId AND c.is_cast = 0 AND c.is_movie = 0")
  Future<List<PersonDb>> findAllCrewForTvShow(int contentId);

  @Query(
      "SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = :contentId AND c.is_cast = 1 AND c.is_movie = 0 ORDER BY c.`order`")
  Future<List<PersonDb>> findAllCastForTvShow(int contentId);
}
