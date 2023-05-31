import 'package:flutter/material.dart';

import '../../../../../../domain/user/elements/todo/todo.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.eventList,
  });

  final List<Todo> eventList;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListView.builder(
          itemCount: eventList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(eventList[index].title),
            );

            // Container(
            //   height: 80,
            //   //    color: colorList[index % colorList.length],
            // );
          },
        ));
  }
}
