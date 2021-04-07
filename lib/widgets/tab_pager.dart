import 'package:flutter/material.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class MovieTabPager extends StatelessWidget {
  final List<String> tabs;
  final int currentPage;
  final Function(int) onTabPressed;
  final Color? backgroundColor;

  const MovieTabPager(
      {Key? key,
      required this.tabs,
      required this.currentPage,
      required this.onTabPressed,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs
          .map(
            (tabText) => _buildTab(
              context,
              tabText,
              tabs.indexOf(tabText),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTab(BuildContext context, String tabText, int index) {
    final isSelected = index == currentPage;
    final selectedStyle = Theme.of(context).textTheme.headline2!;
    final notSelectedStyle =
        selectedStyle.copyWith(color: MovieColors.greyText);
    final indicatorColor = isSelected ? MovieColors.yellow : Colors.transparent;
    return Material(
      color: backgroundColor,
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: () => onTabPressed(index),
            child: Padding(
              padding: const EdgeInsets.all(Dimen.tabTextPadding),
              child: Text(
                tabText,
                style: isSelected ? selectedStyle : notSelectedStyle,
              ),
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
      ),
    );
  }
}
