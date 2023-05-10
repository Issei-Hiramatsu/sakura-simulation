import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../component/local/calendar/event_card/event_card.dart';
import '../../component/local/calendar/event_card/hooks/event.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class TableEventsExample extends HookWidget {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final _focusedDay = useState(DateTime.now());
  final _selectedDay = useState(DateTime.now());

  TableEventsExample({super.key});

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay.value, selectedDay)) {
      _selectedDay.value = selectedDay;
      _focusedDay.value = focusedDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            locale: 'ja_JP',
            focusedDay: _focusedDay.value,
            selectedDayPredicate: (day) =>
                isSameDay(_selectedDay.value, day), //選択できる
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != CalendarFormat.week) {
                _calendarFormat = CalendarFormat.week;
              } else if (_calendarFormat != CalendarFormat.month) {
                _calendarFormat = CalendarFormat.month;
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay.value = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: kEvent.length,
              itemBuilder: (context, index) {
                //日付を習得して対応するデータをここで読み込み予定です。
                final getSelectedDay = _selectedDay.value;
                return EventCard(
                  //データが取得されているかの確認用
                  title: getSelectedDay.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
