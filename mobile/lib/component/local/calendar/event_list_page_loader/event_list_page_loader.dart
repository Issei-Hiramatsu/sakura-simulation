import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../../../domain/default_data.dart';
import '/domain/user/elements/todo/todo.dart';
import 'elements/event_list_and_graph/event_list_and_graph.dart';

class EventListPageView extends HookWidget {
  const EventListPageView({
    super.key,
    required this.onPageChanged,
    required this.goBackPage,
    required this.goFrontPage,
    required this.focusedDay,
    required this.eventList,
  });

  final VoidCallback onPageChanged;
  final VoidCallback goBackPage;
  final VoidCallback goFrontPage;
  final DateTime focusedDay;
  final Map<DateTime, List<Todo>>? eventList;

  @override
  Widget build(BuildContext context) {
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
            DateTime(focusedDay.year, focusedDay.month, focusedDay.day);
        return EventListView(
          eventList: defaultData[0].todoList?[focusedDate] ?? [], //何もないなら[]を返す
        );
      },
    );
  }
}
