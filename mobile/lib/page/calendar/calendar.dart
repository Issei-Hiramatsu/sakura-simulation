import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../component/local/calendar/event_card/event_card.dart';
import '../../component/local/calendar/event_card/hooks/event.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class TableEventsExample extends HookWidget {
  final _calendarFormat = useState(CalendarFormat.month);
  final _focusedDay = useState(DateTime.now());
  final _selectedDay = useState(DateTime.now());
  //TODO: このinitialPageの値を調節することで左スクロールも可能になる。
  //最小値：　サービス開始日の3ヶ月前から
  //最大値:  今日の日付+三ヶ月の範囲にするのがいいと思う。
  //（そしてinitialPageの値をそれらの中心を常に取るようにしてればいけそうな気がするのだ）
  final _controller = useState(PreloadPageController(initialPage: 50));
  final _currentIndex = useState(0);

  TableEventsExample({super.key});

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay.value, selectedDay)) {
      _selectedDay.value = selectedDay;
      _focusedDay.value = focusedDay;
      _calendarFormat.value =
          CalendarFormat.week; //この処理はUIがweekにした方がいい箇所を指す　モーダル等にすることを見越したもの
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
            calendarFormat: _calendarFormat.value,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            onFormatChanged: (format) {
              if (_calendarFormat.value != CalendarFormat.week) {
                _calendarFormat.value = CalendarFormat.week;
              } else if (_calendarFormat.value != CalendarFormat.month) {
                _calendarFormat.value = CalendarFormat.month;
              }
            },
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay.value = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: PreloadPageView.builder(
              preloadPagesCount: 2,
              controller: _controller.value,
              onPageChanged: (index) {
                if (index <= _currentIndex.value) {
                  //戻ったの処理
                  _focusedDay.value = DateTime(
                    _focusedDay.value.year,
                    _focusedDay.value.month,
                    _focusedDay.value.day - 1,
                  );
                } else if (index >= _currentIndex.value) {
                  //一ページ進んだ時の処理
                  _focusedDay.value = DateTime(
                    _focusedDay.value.year,
                    _focusedDay.value.month,
                    _focusedDay.value.day + 1,
                  );
                }
                _selectedDay.value = _focusedDay.value;
                _calendarFormat.value = CalendarFormat.week;
                _currentIndex.value = index;
              },
              itemCount: 100, //100で仮置きする
              //ただし増えすぎても負荷の原因となる気がするので検証してからこの値を変更してほしい。
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
