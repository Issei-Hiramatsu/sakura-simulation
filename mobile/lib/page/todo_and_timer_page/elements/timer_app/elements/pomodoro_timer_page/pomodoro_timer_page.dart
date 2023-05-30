import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/shared/single/shared_app_bar/shared_app_bar.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';

import '../../../../../../component/local/todo_and_timer_app/timer/timer_card/elements/pomodoro_timer/pomodoro_timer.dart';
import '../../../../../../component/local/todo_and_timer_app/todo/hooks/temp_todo_list.dart';
import '../../../../../../component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';
import '../../../../../../component/shared/token/color/color.dart';
import '../../../../../../component/shared/token/text_style/text_style.dart';
import '../../../../../../domain/user/user.dart';

class PomodoroTimerPage extends ConsumerWidget {
  const PomodoroTimerPage({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(tempTodoListProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          titleText: 'タイマー',
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
        children: [
          PomodoroTimer(
            user: user,
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
