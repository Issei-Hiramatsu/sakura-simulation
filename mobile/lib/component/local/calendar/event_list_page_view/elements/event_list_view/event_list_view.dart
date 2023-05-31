import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../../../../../domain/user/elements/todo/todo.dart';
import 'elements/event_card.dart';

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
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('ここに棒グラフ', style: title1Regular(black)), //FIXME:
            ),
            Expanded(
              child: ListView.builder(
                itemCount: eventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return EventCard(
                    title: eventList[index].title,
                    eventTime: '09:00',
                  );
                },
              ),
            ),
          ],
        ));
  }
}
