import 'package:flutter/material.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class MovieTabPager extends StatelessWidget {
  final List<String> tabs;
  final int currentPage;

  const MovieTabPager({Key? key, required this.tabs, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs
          .map(
            (tabText) => _buildTab(
              context,
              tabText,
              tabs.indexOf(tabText) == currentPage,
            ),
          )
          .toList(),
    );
  }

  Column _buildTab(BuildContext context, String tabText, bool isSelected) {
    final selectedStyle = Theme.of(context).textTheme.headline2!;
    final notSelectedStyle =
        selectedStyle.copyWith(color: MovieColors.greyText);
    final indicatorColor = isSelected ? MovieColors.yellow : Colors.transparent;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimen.tabTextPadding),
          child: Text(
            tabText,
            style: isSelected ? selectedStyle : notSelectedStyle,
          ),
        ),
        Row(
          children: [
            Container(
              height: Dimen.tabIndicatorHeight,
              width: Dimen.tabIndicatorWiderWidth,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(
                  Dimen.tabIndicatorRadius,
                ),
              ),
            ),
            SizedBox(
              width: Dimen.tabIndicatorSpace,
            ),
            Container(
              height: Dimen.tabIndicatorHeight,
              width: Dimen.tabIndicatorShorterWidth,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(
                  Dimen.tabIndicatorRadius,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
