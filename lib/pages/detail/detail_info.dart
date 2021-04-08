import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors_headline.dart';
import 'package:movie_app_flutter/pages/detail/detail_buttons.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class DetailInfoPanel extends StatelessWidget {
  final ContentDetailData content;
  final double bottomPadding;

  const DetailInfoPanel(
      {Key? key, required this.content, required this.bottomPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.detailInfoHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.text.detailIntroduction,
              style: textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimen.detailOverviewVerticalPadding),
              child: Text(
                content.overview,
                style: textTheme.headline5,
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ButtonRow(),
            ActorsHeadline(),
            ActorsSection(
              actors: content.cast,
            ),
            SizedBox(
              height: bottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
