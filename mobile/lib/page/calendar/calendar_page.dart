import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../component/local/calendar/event_list_page_loader/event_list_page_loader.dart';
import '../../component/shared/single/shared_app_bar/shared_app_bar.dart';
import '../../component/local/calendar/custom_table_calendar/custom_table_calendar.dart';
import '/domain/user/user.dart';

class CalendarPage extends HookWidget {
  CalendarPage({
    super.key,
    required this.user,
  });
  final User user;
  final _selectedDay = useState(DateTime.now());
  final _focusedDay = useState(DateTime.now());
  final calendarFormat = useState(CalendarFormat.month);

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay.value, selectedDay)) {
      _selectedDay.value = selectedDay;
      _focusedDay.value = focusedDay;
      calendarFormat.value = CalendarFormat.week;
    }
  }

  @override
  Widget build(BuildContext context) {
    final kToday = DateTime.now();
    final kFirstDay = DateTime(
      user.firstTimeUsing!.year,
      user.firstTimeUsing!.month,
      user.firstTimeUsing!.day,
    );
    final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

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
            calendarFormat: calendarFormat.value,
            onFormatChanged: () {
              if (calendarFormat.value != CalendarFormat.week) {
                calendarFormat.value = CalendarFormat.week;
              } else if (calendarFormat.value != CalendarFormat.month) {
                calendarFormat.value = CalendarFormat.month;
              }
            },
            onDaySelected: () => _onDaySelected,
            onPageChanged: () => (focusedDay) {
              focusedDay.value = focusedDay;
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
                calendarFormat.value = CalendarFormat.week;
              },
            ),
          ),
        ],
      ),
    );
  }
}
