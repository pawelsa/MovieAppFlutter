import 'package:flutter/material.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class DetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimen.detailActionBarHeight,
      margin: const EdgeInsets.only(top: Dimen.detailActionBarTopMargin),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimen.detailActionBarHorizontalPadding),
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
                padding: const EdgeInsets.all(Dimen.detailActionBarIconPadding),
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
                padding: const EdgeInsets.all(Dimen.detailActionBarIconPadding),
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
