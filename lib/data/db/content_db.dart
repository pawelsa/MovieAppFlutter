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

final _databaseProvider = FutureProvider<ContentDatabase>((ref) {
  return $FloorContentDatabase.databaseBuilder('content_database.db').build();
});

final peopleDaoProvider = FutureProvider<PeopleDao>((ref) async {
  final db = await ref.watch(_databaseProvider.future);
  return db.peopleDao;
});

final movieDaoProvider = FutureProvider<MovieDao>((ref) async {
  final db = await ref.watch(_databaseProvider.future);
  return db.movieDao;
});

final tvShowDaoProvider = FutureProvider<TvShowDao>((ref) async {
  final db = await ref.watch(_databaseProvider.future);
  return db.tvShowDao;
});

// flutter packages pub run build_runner build
@Database(
    version: 1,
    entities: [ContentDb, PersonDb, ContentPersonDb, MovieDb, TvShowDb])
abstract class ContentDatabase extends FloorDatabase {
  PeopleDao get peopleDao;

  MovieDao get movieDao;

  TvShowDao get tvShowDao;
}
