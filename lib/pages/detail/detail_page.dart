import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors.dart';
import 'package:movie_app_flutter/pages/detail/detail_app_bar.dart';
import 'package:movie_app_flutter/pages/detail/detail_header.dart';
import 'package:movie_app_flutter/pages/detail/detail_info.dart';
import 'package:movie_app_flutter/pages/detail/detail_sheet.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class ContentDetailData extends ContentData {
  final String? backdropPath;
  final String overview;
  final bool isCollected;
  final List<Person> cast;
  final List<Person> crew;

  ContentDetailData({
    required String title,
    required double grade,
    required String director,
    required String stars,
    required String? posterPath,
    required this.backdropPath,
    required this.overview,
    required this.isCollected,
    required this.cast,
    required this.crew,
  }) : super(title, grade, director, stars, posterPath);
}

class DetailPage extends StatelessWidget {
  final ContentDetailData content;

  const DetailPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _buildBlurredImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:
                      size.height * Dimen.detailAdditionalTopPaddingPercentage,
                ),
                DetailHeader(
                  size: size,
                  content: content,
                ),
                DetailInfoPanel(
                  content: content,
                  bottomPadding: Dimen.detailAdditionalBottomPaddingPercentage *
                      size.height,
                ),
              ],
            ),
          ),
          DetailAppBar(),
        ],
      ),
      bottomSheet: DetailSheet(
        size: size,
      ),
    );
  }

  Container _buildBlurredImage() {
    return Container(
      decoration: BoxDecoration(
        image: content.posterPath != null || content.backdropPath != null
            ? DecorationImage(
                image: NetworkImage(
                    content.backdropPath?.path ?? content.posterPath!.path),
                fit: BoxFit.cover,
              )
            : null,
        color: content.posterPath == null ? MovieColors.noImage : null,
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
}
