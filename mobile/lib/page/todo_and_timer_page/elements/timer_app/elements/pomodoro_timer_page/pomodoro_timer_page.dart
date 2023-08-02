import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/importer.dart';

import '/component/local/todo_and_timer_app/timer/pomodoro_timer/pomodoro_timer.dart';
import '/component/local/todo_and_timer_app/todo/hooks/use_todo_list.dart';
import '/component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';
import '/domain/user/user.dart';

class PomodoroTimerPage extends ConsumerWidget {
  const PomodoroTimerPage({
    super.key,
    required this.user,
    required this.workedType,
  });
  final User user;
  final String workedType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          automaticallyImplyLeading: true,
          titleText: 'タイマー',
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
        children: [
          PomodoroTimer(
            user: user,
            workedType: workedType,
          ),
          SpaceBox(height: 12.sp),
          Expanded(
            child: TodoList(
              todoList: todoList,
            ),
          ),
        ],
      ),
    );
  }
}
