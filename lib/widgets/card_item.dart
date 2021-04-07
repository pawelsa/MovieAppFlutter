import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class CardItem extends StatelessWidget {
  final ContentData content;
  final GestureTapCallback onTap;
  final double width;

  const CardItem({
    Key? key,
    required this.onTap,
    required this.content,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterWidth = width / 4;
    final posterHeight = posterWidth / Dimen.posterAspectRatio;

    // TODO make prettier inkWell
    return Container(
      padding: const EdgeInsets.all(Dimen.paddingMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimen.cardItemBorderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimen.cardItemHorizontalPadding,
            vertical: Dimen.cardItemVerticalPadding,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Material(
                  color: Colors.white,
                  elevation: 1.0,
                  borderRadius:
                      BorderRadius.circular(Dimen.cardItemBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimen.cardItemColumnVerticalPadding,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: posterWidth +
                              2 * Dimen.cardItemPosterHorizontalPadding,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    content.title,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          Dimen.cardItemPosterHorizontalPadding,
                                    ),
                                    child: Text(
                                      content.grade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: MovieColors.yellow),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text("categories"),
                              ),
                              Text(
                                context.text.director(content.director),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                context.text.stars(content.stars),
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimen.cardItemPosterHorizontalPadding,
                  bottom: Dimen.itemPosterVerticalPadding,
                ),
                child: Material(
                  elevation: Dimen.cardItemPosterElevation,
                  borderRadius:
                      BorderRadius.circular(Dimen.cardItemBorderRadius),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    height: posterHeight,
                    width: posterWidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(content.posterPath),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
