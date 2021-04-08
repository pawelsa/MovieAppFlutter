import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class ActorsHeadline extends StatelessWidget {
  final GestureTapCallback onShowMore;

  const ActorsHeadline({Key? key, required this.onShowMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: Dimen.detailHeadlineTopPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.text.detailActors,
            style: textTheme.headline2,
          ),
          TextButton(
            onPressed: onShowMore,
            child: Row(
              children: [
                Text(
                  context.text.detailSeeAllActors,
                  style: textTheme.headline5,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: MovieColors.greyText,
                  size: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
