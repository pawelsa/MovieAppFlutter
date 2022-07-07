import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/loading_status/stream_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/resources/durations.dart';
import 'package:movie_app_flutter/widgets/card_item.dart';
import 'package:movie_app_flutter/widgets/tab_pager.dart';

class BaseTabbedPage extends ConsumerWidget {
  final _pageController = PageController(keepPage: true);
  final StateProvider<int> pageProvider;
  final FutureProviderFamily<ContentDetailData, int> contentDetailProvider;
  final List<String> tabs;
  final StreamProvider<StreamData<List<ContentDetailData>>> secondTabProvider;
  final StreamProvider<StreamData<List<ContentDetailData>>> firstTabProvider;

  BaseTabbedPage({
    Key? key,
    required this.pageProvider,
    required this.secondTabProvider,
    required this.firstTabProvider,
    required this.contentDetailProvider,
    required this.tabs,
  }) : super(key: key);

  void _onCardTap(BuildContext context, ContentDetailData content) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(
          content: content,
          provider: contentDetailProvider,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    ref.listen<int>(pageProvider, (_, next) {
      _pageController.animateToPage(
        next,
        duration: Durations.pageChange,
        curve: Curves.easeInOut,
      );
    });
    final providers = [firstTabProvider, secondTabProvider];

    return Column(
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
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) => ref.read(pageProvider.notifier).state = page,
            children: providers.map((e) {
              return ref.watch(e).when(
                    data: (streamData) {
                      return Stack(
                        children: [
                          ListView.builder(
                            itemCount: streamData.data.length,
                            itemBuilder: (context, index) {
                              final item = streamData.data[index];
                              return CardItem(
                                onTap: () => _onCardTap(context, item),
                                content: item,
                                width: size.width,
                              );
                            },
                          ),
                          if(streamData is LoadingData)
                            Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      );
                    },
                    error: (e, stack) {
                      return Text(e.toString());
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
