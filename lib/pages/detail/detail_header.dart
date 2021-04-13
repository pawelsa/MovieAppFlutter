import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class DetailHeader extends StatelessWidget {
  final ContentData content;
  final Size size;

  const DetailHeader({Key? key, required this.content, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterWidth = size.width / 3;
    final posterHeight = size.width / 3 / Dimen.posterAspectRatio;
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimen.cardItemBorderRadius),
            topLeft: Radius.circular(Dimen.cardItemBorderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: posterWidth + 2 * Dimen.detailPosterLeftPadding,
              bottom: Dimen.detailPosterBottomPadding,
              top: Dimen.detailInfoTopPadding,
              right: Dimen.detailPosterLeftPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content.title,
                        style: textTheme.headline2,
                      ),
                      Text("categories"),
                      Text(
                        context.text.director(content.director),
                        style: textTheme.headline3,
                      ),
                      Text(
                        context.text.stars(content.stars),
                        style: textTheme.headline3,
                      ),
                      Text(content.grade.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Dimen.detailPosterLeftPadding,
            bottom: Dimen.detailPosterBottomPadding,
          ),
          child: Material(
            elevation: Dimen.cardItemPosterElevation,
            borderRadius: BorderRadius.circular(Dimen.cardItemBorderRadius),
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: posterHeight,
              width: posterWidth,
              decoration: content.posterPath != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(content.posterPath!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
              color: content.posterPath == null ? MovieColors.noImage : null,
            ),
          ),
        ),
      ],
    );
  }
}
