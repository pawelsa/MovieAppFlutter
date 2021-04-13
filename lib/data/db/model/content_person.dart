import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';

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

  // TODO make sure if this is necessary, but it seems that it is not
  @ColumnInfo(name: 'is_movie')
  final bool isMovie;
  @ColumnInfo(name: 'is_cast')
  final bool isCast;
  final int? order;

  ContentPersonDb(
    this.contentId,
    this.personId,
    this.isMovie,
    this.isCast,
    this.order,
  );
}
