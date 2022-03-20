import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';

abstract class ContentDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<ContentDb> content);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(ContentDb dbContent);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertContentPersons(List<ContentPersonDb> moviePeople);

  Future<List<PersonDb>> findAllCrew(int contentId);

  Future<List<PersonDb>> findAllCast(int contentId);

  Future<ContentDb?> findById(int id);
}
