import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../component/local/calendar/custom_table_calendar/custom_table_calendar.dart';
import '../../component/local/calendar/event_list_page_view/event_list_page_view.dart';
import '../../component/shared/single/shared_app_bar/shared_app_bar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class TableEventsExample extends HookWidget {
  TableEventsExample({super.key});
  final _calendarFormat = useState(CalendarFormat.month);
  final _focusedDay = useState(DateTime.now());
  final _selectedDay = useState(DateTime.now());

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay.value, selectedDay)) {
      _selectedDay.value = selectedDay;
      _focusedDay.value = focusedDay;
      _calendarFormat.value = CalendarFormat.week;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          titleText: 'タスクをマネジメントする',
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
        children: [
          CustomTableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            selectedDay: _selectedDay.value,
            calendarFormat: _calendarFormat.value,
            onFormatChanged: () {
              if (_calendarFormat.value != CalendarFormat.week) {
                _calendarFormat.value = CalendarFormat.week;
              } else if (_calendarFormat.value != CalendarFormat.month) {
                _calendarFormat.value = CalendarFormat.month;
              }
            },
            onDaySelected: () => _onDaySelected,
            onPageChanged: () => (focusedDay) {
              _focusedDay.value = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: EventListPageView(
              focusedDay: _focusedDay.value,
              goBackPage: () {
                _focusedDay.value = DateTime(
                  _focusedDay.value.year,
                  _focusedDay.value.month,
                  _focusedDay.value.day - 1,
                );
              },
              goFrontPage: () {
                _focusedDay.value = DateTime(
                  _focusedDay.value.year,
                  _focusedDay.value.month,
                  _focusedDay.value.day + 1,
                );
              },
              onPageChanged: () {
                _selectedDay.value = _focusedDay.value;
                _calendarFormat.value = CalendarFormat.week;
              },
            ),
          ),
        ],
      ),
    );
  }
}
