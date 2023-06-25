import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/calendar/event_page_loader_by_date/elements/event_list_and_graph/elements/event_graph/event_graph.dart';
import 'package:sakura_simulation/importer.dart';

import '../../../../../../domain/user/elements/todo/todo.dart';
import 'elements/event_card/event_card.dart';

class EventListView extends StatelessWidget {
  const EventListView({
    super.key,
    required this.eventList,
  });

  final List<Todo> eventList;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: EventGraph(),
            ),
            Expanded(
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
            ),
          ],
        ));
  }
}
