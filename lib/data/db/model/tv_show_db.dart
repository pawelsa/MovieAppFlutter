import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';

@Entity(
  tableName: 'tv_show',
  primaryKeys: ['id', 'is_popular'],
  foreignKeys: [
    ForeignKey(childColumns: ['id'], parentColumns: ['id'], entity: ContentDb),
  ],
)
class TvShowDb {
  final int id;
  @ColumnInfo(name: 'is_popular')
  final bool isPopular;
  final int order;

  TvShowDb(this.id, this.isPopular, this.order);
}
