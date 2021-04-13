import 'dart:async';

import 'package:floor/floor.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'content_db.g.dart';

// flutter packages pub run build_runner build
@Database(version: 1, entities: [ContentDb, PersonDb, ContentPersonDb])
abstract class ContentDatabase extends FloorDatabase {}
