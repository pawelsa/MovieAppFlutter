import 'package:flutter/material.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class ActorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ActorsAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimen.detailActionBarHorizontalPadding,
        ),
        alignment: Alignment.center,
        height: preferredSize.height,
        width: preferredSize.width,
        child: Row(
          children: [
            InkWell(
              customBorder: CircleBorder(),
              onTap: Navigator.of(context).pop,
              child: Padding(
                padding: const EdgeInsets.all(Dimen.iconPadding),
                child: Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(
              width: Dimen.actorsAppBarSpacer,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimen.actorsAppBarHeight);
}
