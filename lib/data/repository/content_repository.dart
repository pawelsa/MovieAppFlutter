import 'package:collection/collection.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/db/dao/content_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/data/view/person.dart';

abstract class ContentRepository {
  final ContentDao _contentDao;
  final PeopleDao _peopleDao;
  final bool isMovie;

  ContentRepository(this._contentDao, this._peopleDao, this.isMovie);

  Future saveContentInDb(ApiContent content, String director, String stars,
      ApiCredits movieCredits, Future<void> insertContent) async {
    final dbContent = ContentDb(
      content.id,
      isMovie,
      content.title,
      content.voteAverage,
      director,
      stars,
      content.posterPath,
      content.backdropPath,
      content.overview,
    );

    final cast = movieCredits.cast
        .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character, e.order,
            e.department, e.job, e.creditId))
        .toList();
    final crew = movieCredits.crew
        .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character, e.order,
            e.department, e.job, e.creditId))
        .toList();

    final contentPerson = cast
        .map((e) => ContentPersonDb(
            content.id, e.id, e.creditId, isMovie, true, e.order))
        .toList()
          ..addAll(crew.map((e) => ContentPersonDb(
              content.id, e.id, e.creditId, isMovie, false, e.order)));

    await _contentDao.insert(dbContent);
    await insertContent;
    await _peopleDao.insertPeople(cast);
    await _peopleDao.insertPeople(crew);
    await _contentDao.insertContentPersons(contentPerson);
  }

  Future<List<ContentDetailData>> getDetailsFromDb(
      List<ContentDb> moviesDb) async {
    final movies = <ContentDetailData>[];
    for (var movie in moviesDb) {
      final movieCast = await _contentDao.findAllCast(movie.id);
      final movieCrew = await _contentDao.findAllCrew(movie.id);

      final cast = mapCast(db: movieCast);
      final crew = mapCrew(db: movieCrew);

      movies.add(
        ContentDetailData(
          id: movie.id,
          title: movie.title,
          grade: movie.grade,
          director: movie.director,
          stars: movie.stars,
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
          overview: movie.overview,
          isCollected: false,
          cast: cast,
          crew: crew,
        ),
      );
    }
    return movies;
  }

  List<Person> mapCrew({List<PersonDb>? db, List<ApiPerson>? api}) => db != null
      ? _mapDbPersons(
          db,
          (persons) => Person(persons.first.name, persons.first.profilePath,
              persons.mapToList((e) => e.job!)),
        )
      : _mapApiPeople(
          api!,
          (people) => Person(people.first.name, people.first.profilePath,
              people.mapToList((e) => e.job!)),
        );

  List<Person> mapCast({List<PersonDb>? db, List<ApiPerson>? api}) => db != null
      ? _mapDbPersons(
          db,
          (persons) => Person(persons.first.name, persons.first.profilePath,
              persons.mapToList((e) => e.character!)),
        )
      : _mapApiPeople(
          api!,
          (people) => Person(people.first.name, people.first.profilePath,
              people.mapToList((e) => e.character!)),
        );

  List<Person> _mapDbPersons(
      List<PersonDb> castDb, Person Function(List<PersonDb>) map) {
    final castGrouped = groupBy<PersonDb, int>(castDb, (person) => person.id);
    final cast = <Person>[];
    castGrouped.forEach((personId, persons) {
      cast.add(map(persons));
    });
    return cast;
  }

  List<Person> _mapApiPeople(
      List<ApiPerson> apiPeople, Person Function(List<ApiPerson>) map) {
    final peopleGrouped =
        groupBy<ApiPerson, int>(apiPeople, (person) => person.id);
    final people = <Person>[];
    peopleGrouped.forEach((personId, persons) {
      people.add(map(persons));
    });
    return people;
  }

  Future<ContentDetailData> getDetailedFromDb(int id) async {
    final contentDb = await _contentDao.findById(id);
    final contentCast = await _contentDao.findAllCast(id);
    final contentCrew = await _contentDao.findAllCrew(id);

    final cast = mapCast(db: contentCast);
    final crew = mapCrew(db: contentCrew);

    return ContentDetailData(
      id: contentDb?.id ?? id,
      title: contentDb?.title ?? "",
      grade: contentDb?.grade ?? 0.0,
      director: contentDb?.director ?? "",
      stars: contentDb?.stars ?? "",
      posterPath: contentDb?.posterPath,
      backdropPath: contentDb?.backdropPath,
      overview: contentDb?.overview ?? "",
      isCollected: false,
      cast: cast,
      crew: crew,
    );
  }

  List<ContentData> getContentFromDb(List<ContentDb> moviesDb) {
    return moviesDb.mapToList(
      (movie) => ContentData(
        movie.id,
        movie.title,
        movie.grade,
        movie.director,
        movie.stars,
        movie.posterPath,
      ),
    );
  }
}
