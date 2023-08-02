import 'package:flutter/material.dart';

import '../../../../../../../../importer.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.isFavorite,
    required this.isCompleted,
    required this.eventTime,
  });

  final String title;
  final bool isFavorite;
  final bool isCompleted;
  final String eventTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: gray,
            width: 0.5,
          ),
        ),
        color: backgroundWhite,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isFavorite ? tertiary : primary5,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: isCompleted
              ? Icon(Icons.check, color: isFavorite ? yellow : gray)
              : Icon(Icons.check, color: isFavorite ? tertiary : primary5),
        ),
        title: Text(title, style: labelLargeLineThrough(black)),
        trailing: Text(eventTime),
      ),
    );
  }
}
