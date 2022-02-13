import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/main/main_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';

class MainBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: SizedBox(
        height: 70,
        child: Consumer(
          builder: (context, ref, _) {
            final currentPage = ref.watch(pageProvider);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildIconButton(ref, currentPage, AppPage.MOVIE),
                _buildIconButton(ref, currentPage, AppPage.TV_SHOW),
                _buildIconButton(ref, currentPage, AppPage.PROFILE),
              ],
            );
          },
        ),
      ),
    );
  }

  IconButton _buildIconButton(WidgetRef ref, AppPage current, AppPage page) {
    final isCurrent = page == current;
    final icon = _getIcon(page);
    return IconButton(
      icon: Icon(
        icon,
        color: isCurrent ? MovieColors.yellow : const Color(0xFFA9AAAA),
      ),
      onPressed: () => ref.read(pageProvider.notifier).state = page,
    );
  }

  IconData _getIcon(AppPage page) {
    if (page == AppPage.MOVIE) {
      return Icons.home_outlined;
    } else if (page == AppPage.TV_SHOW) {
      return Icons.edit_outlined;
    } else {
      return Icons.person_outline;
    }
  }
}
