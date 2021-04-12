import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/resources/durations.dart';
import 'package:movie_app_flutter/widgets/card_item.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

class BaseTabbedPage extends StatelessWidget {
  final _pageController = PageController();
  final StateProvider<int> pageProvider;
  final FutureProvider<List<List<ContentDetailData>>> contentProvider;
  final List<String> tabs;

  BaseTabbedPage({
    Key? key,
    required this.pageProvider,
    required this.contentProvider,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ProviderListener<StateController<int>>(
      provider: pageProvider,
      onChange: (context, provider) {
        _pageController.animateToPage(
          provider.state,
          duration: Durations.pageChange,
          curve: Curves.easeInOut,
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 17.0,
              top: 4.0,
            ),
            child: MovieTabPager(
              backgroundColor: Colors.transparent,
              pageProvider: pageProvider,
              tabs: tabs,
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final tabContent = watch(contentProvider);
                return tabContent.when(
                  data: (tabContent) => PageView.builder(
                    controller: _pageController,
                    onPageChanged: (page) =>
                        context.read(pageProvider).state = page,
                    itemCount: tabContent.length,
                    itemBuilder: (context, tabIndex) {
                      return ListView.builder(
                        itemCount: tabContent[tabIndex].length,
                        itemBuilder: (context, index) {
                          final item = tabContent[tabIndex][index];
                          return CardItem(
                            onTap: () => _onCardTap(context, item),
                            content: item,
                            width: size.width,
                          );
                        },
                      );
                    },
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, stack) {
                    debugPrint(
                        "BaseTabbedPage:build - error: ${stack.toString()}");
                    return Text(e.toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onCardTap(BuildContext context, ContentDetailData content) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(
          content: content,
        ),
      ),
    );
  }
}
