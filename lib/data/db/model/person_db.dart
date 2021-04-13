import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';

@Entity(tableName: 'persons')
class PersonDb {
  @primaryKey
  final int id;
  final String name;
  @ColumnInfo(name: 'profile_path')
  final String? profilePath;
  final String? character;
  final int? order;
  final String? department;
  final String? job;

  PersonDb(
    this.id,
    this.name,
    this.profilePath,
    this.character,
    this.order,
    this.department,
    this.job,
  );
}

@Entity(
  tableName: 'content_person',
  primaryKeys: ['content_id', 'person_id'],
  foreignKeys: [
    ForeignKey(
        childColumns: ['content_id'], parentColumns: ['id'], entity: ContentDb),
    ForeignKey(
        childColumns: ['person_id'], parentColumns: ['id'], entity: PersonDb),
  ],
)
class ContentPersonDb {
  @ColumnInfo(name: 'content_id')
  final int contentId;
  @ColumnInfo(name: 'person_id')
  final int personId;
  final int order;

  ContentPersonDb(
    this.contentId,
    this.personId,
    this.order,
  );
}
