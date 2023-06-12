import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:sakura_simulation/importer.dart';

import '../../todo_and_timer_app/todo/todo_list/elements/hooks/fetch_todo_list.dart';
import 'elements/event_list_and_graph/event_list_and_graph.dart';

class EventListPageView extends HookConsumerWidget {
  const EventListPageView({
    super.key,
    required this.onPageChanged,
    required this.goBackPage,
    required this.goFrontPage,
    required this.focusedDay,
  });

  final VoidCallback onPageChanged;
  final VoidCallback goBackPage;
  final VoidCallback goFrontPage;
  final DateTime focusedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final controller = useState(PreloadPageController(initialPage: 50));

    return PreloadPageView.builder(
      preloadPagesCount: 2,
      controller: controller.value,
      onPageChanged: (index) {
        if (index <= currentIndex.value) {
          goBackPage();
        } else if (index >= currentIndex.value) {
          goFrontPage();
        }
        onPageChanged();
        currentIndex.value = index;
      },
      itemCount: 100, //100で仮置きする。ただし増えすぎても負荷の原因となる気がするので検証してからこの値を変更してほしい。
      itemBuilder: (context, index) {
        final focusedDate =
            DateTime.utc(focusedDay.year, focusedDay.month, focusedDay.day);
        return ref.watch(fetchAllTodoList(context)).when(
              data: (dataList) =>
                  EventListView(eventList: dataList[focusedDate] ?? []),
              error: (error, _) => const Icon(Icons.error),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              ),
            );
      },
    );
  }
}
