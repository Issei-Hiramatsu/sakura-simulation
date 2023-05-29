import 'package:flutter/material.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/elements/pomodoro_timer_page/pomodoro_timer_page.dart';
import 'package:sakura_simulation/domain/default_data.dart';

import '../../../../component/local/todo_and_timer_app/timer/timer_card/timer_card.dart';
import '../../../../component/shared/single/border_box/border_box.dart';
import '../../../../component/shared/token/color/color.dart';

class TimerAppPage extends StatelessWidget {
  const TimerAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalBorderBox(
                borderColor: backgroundGray,
                borderWidth: 1,
                child: TimerCard(
                  text: 'ポモドーロタイマーを起動する',
                  workTime: defaultData[0].workTime,
                  timerPage: PomodoroTimerPage(user: defaultData[0]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
