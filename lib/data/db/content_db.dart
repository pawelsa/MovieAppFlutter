import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/db/dao/movie_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/dao/tv_show_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'content_db.g.dart';

final databaseProvider = Provider<ContentDatabase>((ref) {
  return _TemporaryDatabase();
});

final peopleDaoProvider = Provider<PeopleDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.peopleDao;
});

final movieDaoProvider = Provider<MovieDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.movieDao;
});

final tvShowDaoProvider = Provider<TvShowDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.tvShowDao;
});

/// Database that is used to fulfil Provider,
/// as we want to avoid using FutureProvider for database.
/// This implementation is replaced with the actual implementation
/// before runApp function is executed
class _TemporaryDatabase extends ContentDatabase {
  @override
  MovieDao get movieDao => throw UnimplementedError();

  @override
  PeopleDao get peopleDao => throw UnimplementedError();

  @override
  TvShowDao get tvShowDao => throw UnimplementedError();
}

// flutter packages pub run build_runner build
@Database(version: 1, entities: [ContentDb, PersonDb, ContentPersonDb, MovieDb, TvShowDb])
abstract class ContentDatabase extends FloorDatabase {
  PeopleDao get peopleDao;

  MovieDao get movieDao;

  TvShowDao get tvShowDao;
}
