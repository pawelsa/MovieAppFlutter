import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class Person {
  final String name;
  final String? profilePath;
  final String position;

  Person(this.name, this.profilePath, this.position);
}

class ActorsSection extends StatelessWidget {
  final List<Person> actors;

  ActorsSection({Key? key, required List<Person> actors})
      : this.actors = actors.take(4).toList(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: actors
          .map(
            (person) => _buildItem(context, person),
          )
          .toList(),
    );
  }

  Expanded _buildItem(BuildContext context, Person person) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(bottom: Dimen.detailActorsBottomMargin),
            height: Dimen.detailActorsImageSize,
            width: Dimen.detailActorsImageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: person.profilePath != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(person.profilePath!.path),
                    )
                  : null,
              color: person.profilePath == null ? MovieColors.noImage : null,
            ),
          ),
          Text(
            person.name,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          Text(
            person.position,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
