import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../../shared/single/shared_dialog/shared_dialog.dart';
import 'elements/event_list_and_graph/event_list_and_graph.dart';

class EventPageLoaderByDate extends HookConsumerWidget {
  const EventPageLoaderByDate({
    super.key,
    required this.onPageChanged,
    required this.goBackPage,
    required this.goFrontPage,
    required this.focusedDate,
    required this.firstPageDate,
    required this.lastPageDate,
  });

  final VoidCallback onPageChanged;
  final VoidCallback goBackPage;
  final VoidCallback goFrontPage;
  final DateTime focusedDate;
  final DateTime firstPageDate;
  final DateTime lastPageDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final controller = useState(PreloadPageController(
      initialPage: DateTime.now().difference(firstPageDate).inDays,
    ));

    return PreloadPageView.builder(
      preloadPagesCount: 2,
      controller: controller.value,
      onPageChanged: (index) {
        if (index <= currentIndex.value && focusedDate != firstPageDate) {
          goBackPage();
        } else if (index >= currentIndex.value && focusedDate != lastPageDate) {
          goFrontPage();
        } else {
          showDialog(
              context: context,
              builder: (_) {
                return const SharedDialog(
                  title: 'ページ表示上限',
                  message: 'このページの表示上限に達しました',
                );
              });
        }
        currentIndex.value = index;
        onPageChanged();
      },
      itemCount: lastPageDate.difference(firstPageDate).inDays,
      itemBuilder: (context, index) {
        return EventListView(focusedDate: focusedDate);
      },
    );
  }
}
