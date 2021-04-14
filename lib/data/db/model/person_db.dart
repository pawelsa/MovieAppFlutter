import 'package:floor/floor.dart';

@Entity(tableName: 'persons', primaryKeys: ['id', 'credit_id'])
class PersonDb {
  final int id;
  final String name;
  @ColumnInfo(name: 'profile_path')
  final String? profilePath;
  final String? character;
  final int? order;
  final String? department;
  final String? job;
  @ColumnInfo(name: 'credit_id')
  final String creditId;

  PersonDb(
    this.id,
    this.name,
    this.profilePath,
    this.character,
    this.order,
    this.department,
    this.job,
    this.creditId,
  );
}
