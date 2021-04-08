import 'package:flutter/material.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class Person {
  final String name;
  final String profilePath;
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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(person.profilePath),
              ),
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
