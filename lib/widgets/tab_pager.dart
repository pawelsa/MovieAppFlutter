import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class MovieTabPager extends ConsumerWidget {
  final StateProvider<int> pageProvider;
  final List<String> tabs;
  final Color? backgroundColor;

  const MovieTabPager({
    Key? key,
    required this.tabs,
    required this.pageProvider,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(pageProvider).state;
    return Row(
      children: tabs
          .map(
            (tabText) => _buildTab(
              context,
              tabText,
              tabs.indexOf(tabText),
              currentPage,
            ),
          )
          .toList(),
    );
  }

  Widget _buildTab(
      BuildContext context, String tabText, int index, int currentPage) {
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
            onTap: () => context.read(pageProvider).state = index,
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
