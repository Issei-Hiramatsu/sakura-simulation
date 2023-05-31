import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:sakura_simulation/component/local/calendar/event_list_page_view/hooks/use_page_control.dart';

import 'elements/event_card/event_card.dart';

class EventListPageView extends HookWidget {
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
      itemCount: 100, //100で仮置きする
      //ただし増えすぎても負荷の原因となる気がするので検証してからこの値を変更してほしい。
      itemBuilder: (context, index) {
        const getSelectedDay = '_selectedDay.value';
        return EventCard(
          //データが取得されているかの確認用
          //日付を習得して対応するデータをここで読み込み予定です。
          title: getSelectedDay.toString(),
        );
      },
    );
  }
}
