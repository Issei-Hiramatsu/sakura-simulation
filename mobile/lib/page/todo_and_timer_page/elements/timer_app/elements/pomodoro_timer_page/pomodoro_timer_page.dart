import 'package:flutter/material.dart';

import '../../../../../../component/local/todo_and_timer_app/timer/pomodoro_timer/pomodoro_timer_with_todo.dart';

class PomodoroTimerPage extends StatelessWidget {
  const PomodoroTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PomodoroTimerWithTodo(),
    );
  }
}
