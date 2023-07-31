import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/importer.dart';

import '../../../../../shared/single/shared_circular_progress_indicator/shared_circular_progress_indicator.dart';
import 'elements/event_card/event_card.dart';
import 'elements/review_graph/review_graph.dart';
import 'hooks/fetch_timer_log.dart';
import 'hooks/fetch_todo_list.dart';

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
                    child: ReviewGraph(
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
          ref.watch(fetchAllTodoList(focusedDate)).when(
                data: (dataList) {
                  final focusedDateList = [
                    ...dataList.where((todo) {
                      final createdPeriod = DateTime(todo.createdPeriod.year,
                          todo.createdPeriod.month, todo.createdPeriod.day);
                      return createdPeriod == focusedDate;
                    })
                  ];
                  final sortedDataList = [
                    ...focusedDateList
                        .where((todo) => todo.isFavorite && todo.isCompleted),
                    ...focusedDateList
                        .where((todo) => todo.isFavorite && !todo.isCompleted),
                    ...focusedDateList
                        .where((todo) => todo.isCompleted && !todo.isFavorite),
                  ];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: sortedDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EventCard(
                          isCompleted: sortedDataList[index].isCompleted,
                          isFavorite: sortedDataList[index].isFavorite,
                          title: sortedDataList[index].title,
                          eventTime: sortedDataList[index]
                              .completedPeriod
                              .toString()
                              .substring(11, 16), //例: 09:00
                        );
                      },
                    ),
                  );
                },
                error: (error, _) {
                  print(error);
                  return const Icon(Icons.error);
                },
                loading: () => const SharedCircularProgressIndicator(),
              ),
        ],
      ),
    );
  }
}
