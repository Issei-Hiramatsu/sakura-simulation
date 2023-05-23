import 'package:flutter/material.dart';

import '../../../../../../component/local/todo_and_timer_app/timer/timer_card/elements/pomodoro_timer/pomodoro_timer.dart';

class PomodoroTimerPage extends StatelessWidget {
  const PomodoroTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PomodoroTimer(),
    );
  }
}
