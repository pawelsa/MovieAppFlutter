import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';
import 'package:movie_app_flutter/resources/durations.dart';
import 'package:movie_app_flutter/widgets/card_item.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

class BaseTabbedPage extends StatelessWidget {
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
              pageProvider: pageProvider,
              tabs: tabs,
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
          content: ContentDetailData(
            "Title",
            "8.0",
            "Michael",
            "Michael / Lopez",
            "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
            "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
            "Chihiro and mom and dad drove to their new home together, in the outskurts of the road accidentally into the mysteriuus tunnel - they went to another strange...",
            false,
            [
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor")
            ],
            [
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
              Person(
                  "Imie nazwisko",
                  "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
                  "actor"),
            ],
          ),
        ),
      ),
    );
  }
}
