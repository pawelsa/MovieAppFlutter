import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/widgets/card_item.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

class BaseTabbedPage extends ConsumerWidget {
  final _pageController = PageController();
  final StateProvider<int> pageProvider;
  final StateProvider<List<List<ContentData>>> contentProvider;
  final List<String> tabs;

  BaseTabbedPage({
    Key? key,
    required this.pageProvider,
    required this.contentProvider,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentPage = watch(pageProvider).state;
    final size = MediaQuery.of(context).size;

    return ProviderListener<StateController<int>>(
      provider: pageProvider,
      onChange: (context, provider) {
        _pageController.animateToPage(provider.state,
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 20.0,
            ),
            child: MovieTabPager(
              currentPage: currentPage,
              tabs: tabs,
              onTabPressed: (index) => context.read(pageProvider).state = index,
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final tabContent = watch(contentProvider).state;
                return PageView.builder(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onCardTap(BuildContext context, ContentData content) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(
          content: content,
        ),
      ),
    );
  }
}
