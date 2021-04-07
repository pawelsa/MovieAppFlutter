import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

class DetailPage extends StatelessWidget {
  final ContentData content;

  const DetailPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final posterWidth = size.width / 3;
    final posterHeight = size.width / 3 / Dimen.posterAspectRatio;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          _buildBlurredImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Stack(
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
                            left: posterWidth + 2 * 21, bottom: 34, top: 21),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
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
                                Text(content.grade),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        bottom: 34,
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
                    ),
                  ],
                ),
                Material(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Introduction",
                          style: textTheme.headline2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Chihiro and mom and dad drove to their new home together, in the outskurts of the road accidentally into the mysteriuus tunnel - they went to another strange...",
                            style: textTheme.headline5,
                            textAlign: TextAlign.justify,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: RawMaterialButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                fillColor: MovieColors.greyButton,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 15.0),
                                elevation: 0.0,
                                child: Text(
                                  "Collect",
                                  style: textTheme.button!.copyWith(
                                      color: MovieColors.greyButtonText),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Expanded(
                              flex: 8,
                              child: RawMaterialButton(
                                onPressed: () {},
                                fillColor: MovieColors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  "Buy now",
                                  style: textTheme.button,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Actor",
                                style: textTheme.headline2,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "See all",
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
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(content.posterPath),
                                      ),
                                    ),
                                  ),
                                  Text("Imie nazwisko")
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(content.posterPath),
                                      ),
                                    ),
                                  ),
                                  Text("Imie nazwisko")
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(content.posterPath),
                                      ),
                                    ),
                                  ),
                                  Text("Imie nazwisko")
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(content.posterPath),
                                      ),
                                    ),
                                  ),
                                  Text("Imie nazwisko")
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildAppBar(context),
        ],
      ),
      bottomSheet: _buildBottomSheet(size, textTheme),
    );
  }

  DraggableScrollableSheet _buildBottomSheet(Size size, TextTheme textTheme) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.12,
      minChildSize: 0.12,
      maxChildSize: 0.8,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          child: Container(
            height: size.height * 0.8,
            width: size.width,
            child: Column(
              children: [
                Container(
                  height: 6,
                  width: 40,
                  margin: const EdgeInsets.symmetric(vertical: 25.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MovieColors.greyPill,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: MovieTabPager(
                    tabs: ["Comments", "Discussion"],
                    currentPage: 0,
                    onTabPressed: (index) {},
                    backgroundColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: PageView(
                    children: [
                      Container(
                        height: 300,
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        color: Colors.white,
                        child: Text(
                          "There is nothing to show",
                          style: textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 300,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Text(
                          "There is nothing to show",
                          style: textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBlurredImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(content.posterPath),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.001),
          ),
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.white.withOpacity(0.15),
            shape: CircleBorder(),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              customBorder: CircleBorder(),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white.withOpacity(0.15),
            shape: CircleBorder(),
            child: InkWell(
              onTap: () {},
              customBorder: CircleBorder(),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
