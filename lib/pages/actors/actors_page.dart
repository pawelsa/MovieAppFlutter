import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/pages/actors/actors_app_bar.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

final _pageProvider = StateProvider<int>((ref) => 0);

class ActorsPage extends StatelessWidget {
  final ContentDetailData contentDetailData;
  final _pageController = PageController();

  ActorsPage({
    Key? key,
    required this.contentDetailData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width / 5;
    final tabs = <String>[context.text.actorsCast, context.text.actorsCrew];
    return Container(
      decoration: BoxDecoration(gradient: MovieColors.pageGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ActorsAppBar(
          title: contentDetailData.title,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.actorsPagerHorizontalPadding),
              child: MovieTabPager(
                tabs: tabs,
                pageProvider: _pageProvider,
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (page) =>
                    context.read(_pageProvider).state = page,
                controller: _pageController,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  final people = index == 0
                      ? contentDetailData.cast
                      : contentDetailData.crew;

                  return ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, personIndex) {
                      final person = people[personIndex];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: Dimen.actorsListLeftPadding,
                          right: Dimen.actorsListRightPadding,
                          bottom: personIndex == (people.length - 1)
                              ? Dimen.actorsListItemExtendedPadding
                              : Dimen.actorsListItemStandardPadding,
                          top: personIndex == 0
                              ? Dimen.actorsListItemExtendedPadding
                              : Dimen.actorsListItemStandardPadding,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimen.cardItemBorderRadius),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Dimen.actorsInfoVerticalPadding,
                                      bottom: Dimen.actorsInfoVerticalPadding,
                                      left: imageWidth +
                                          2 * Dimen.actorsImagePadding,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          person.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        Text(
                                          person.position,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: imageWidth,
                              height: imageWidth,
                              margin: const EdgeInsets.only(
                                left: Dimen.actorsImagePadding,
                                bottom: Dimen.actorsImagePadding,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(person.profilePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
