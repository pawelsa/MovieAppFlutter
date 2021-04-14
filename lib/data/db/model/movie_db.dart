import 'package:floor/floor.dart';

@Entity(
  tableName: 'movie',
  primaryKeys: ['id', 'is_popular'],
  // foreignKeys: [
  //   ForeignKey(childColumns: ['id'], parentColumns: ['id'], entity: ContentDb),
  // ],
)
class MovieDb {
  final int id;
  @ColumnInfo(name: 'is_popular')
  final bool isPopular;
  final int order;

  MovieDb(this.id, this.isPopular, this.order);
}
