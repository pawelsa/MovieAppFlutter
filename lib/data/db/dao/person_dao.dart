import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';

@dao
abstract class PeopleDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertPeople(List<PersonDb> people);

  // TODO handle multiple roles of people in repo

}
