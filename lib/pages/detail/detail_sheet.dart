import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';
import 'package:movie_app_flutter/resources/durations.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

final _pageProvider = StateProvider((ref) => 0);

class DetailSheet extends StatelessWidget {
  final Size size;
  final PageController _pageController = PageController();

  DetailSheet({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ProviderListener<StateController<int>>(
      provider: _pageProvider,
      onChange: (context, provider) {
        _pageController.animateToPage(
          provider.state,
          duration: Durations.pageChange,
          curve: Curves.easeInOut,
        );
      },
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: Dimen.detailDraggableInitialPercentage,
        minChildSize: Dimen.detailDraggableInitialPercentage,
        maxChildSize: Dimen.detailDraggableMaxPercentage,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Material(
            color: Colors.white,
            elevation: Dimen.detailDraggableElevation,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimen.detailDraggableCorner),
              topRight: Radius.circular(Dimen.detailDraggableCorner),
            ),
            child: Container(
              height: size.height * 0.8,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    height: Dimen.detailDraggablePillHeight,
                    width: Dimen.detailDraggablePillWidth,
                    margin: const EdgeInsets.symmetric(
                        vertical: Dimen.detailDraggablePillMargin),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MovieColors.greyPill,
                      borderRadius: BorderRadius.circular(
                          Dimen.detailDraggablePillCorner),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimen.detailDraggableTabPadding),
                    child: MovieTabPager(
                      pageProvider: _pageProvider,
                      tabs: [
                        context.text.detailComments,
                        context.text.detailDiscuss,
                      ],
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) =>
                          context.read(_pageProvider).state = page,
                      children: [
                        Container(
                          height: Dimen.detailDraggableContentDefaultHeight,
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimen.detailDraggableContentPadding,
                          ),
                          color: Colors.white,
                          child: Text(
                            context.text.nothingToShow,
                            style: textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: Dimen.detailDraggableContentDefaultHeight,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimen.detailDraggableContentPadding,
                          ),
                          child: Text(
                            context.text.nothingToShow,
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
      ),
    );
  }
}
