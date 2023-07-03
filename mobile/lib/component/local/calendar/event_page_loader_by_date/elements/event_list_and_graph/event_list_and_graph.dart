import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/calendar/event_page_loader_by_date/elements/event_list_and_graph/elements/event_graph/event_graph.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/timer_review/hooks/fetch_timer_log.dart';
import 'package:sakura_simulation/importer.dart';

import '../../../../../shared/single/shared_circular_progress_indicator/shared_circular_progress_indicator.dart';
import '../../../../todo_and_timer_app/todo/hooks/fetch_todo_list.dart';
import 'elements/event_card/event_card.dart';

class EventListView extends ConsumerWidget {
  const EventListView({
    super.key,
    required this.focusedDate,
  });

  final DateTime focusedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: white,
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: Column(
        children: [
          ref.watch(fetchAllTimerLog(context)).when(
                data: (dataList) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EventGraph(
                      timerLog: dataList[focusedDate] ??
                          {
                            '集中時間': [const Duration(seconds: 0)]
                          },
                    ),
                  );
                },
                error: (error, _) => const Icon(Icons.error),
                loading: () => const SharedCircularProgressIndicator(),
              ),
          ref.watch(fetchAllFavoriteAndCompletedTodoList(context)).when(
                data: (dataList) {
                  final eventList = dataList[focusedDate] ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: eventList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final sortedEventList = [
                          ...eventList.where((todo) => todo.isFavorite),
                          ...eventList.where((todo) => !todo.isFavorite),
                        ];
                        return EventCard(
                          isCompleted: sortedEventList[index].isCompleted,
                          isFavorite: sortedEventList[index].isFavorite,
                          title: sortedEventList[index].title,
                          eventTime: '09:00',
                        );
                      },
                    ),
                  );
                },
                error: (error, _) => const Icon(Icons.error),
                loading: () => const SharedCircularProgressIndicator(),
              ),
        ],
      ),
    );
  }
}
