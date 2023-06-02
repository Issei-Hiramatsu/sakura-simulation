import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({
    super.key,
    required this.onFormatChanged,
    required this.onDaySelected,
    required this.onPageChanged,
    required this.calendarFormat,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    required this.selectedDay,
  });

  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final VoidCallback onFormatChanged;
  final Function onDaySelected;
  final VoidCallback onPageChanged;
  //VoidCallBackは渡した関数をただ実行して欲しい時に使い、Functionは受け取った引数を使って何かしたい時に使われる

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      locale: 'ja_JP',
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day), //選択できる
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: const CalendarStyle(outsideDaysVisible: false),
      onFormatChanged: (format) => onFormatChanged(),
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: title1Bold(black),
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: primary,
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: primary,
          )),
      onDaySelected: onDaySelected(),
      onPageChanged: (focusedDay) => onPageChanged(),
    );
  }
}
