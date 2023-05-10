import 'package:flutter/material.dart';

import 'hooks/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.value,
    required this.index,
  });
  final List<Event> value;
  final int index;

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
      child: ListTile(
        title: Text('${value[index]}'),
      ),
    );
  }
}
