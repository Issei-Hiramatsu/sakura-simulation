import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/importer.dart';

import '/domain/user/user.dart';
import '../../../../../../component/local/todo_and_timer_app/todo/todo_add_button/todo_add_circular_button.dart';
import '/component/local/todo_and_timer_app/timer/timer_review/sakura_review_screen/sakura_review_screen.dart';
import '/component/local/todo_and_timer_app/timer/timer_review/timer_review_app_bar/timer_review_app_bar.dart';
import '/component/local/todo_and_timer_app/todo/hooks/use_todo_list.dart';
import '/component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';

class TimerReviewPage extends ConsumerWidget {
  const TimerReviewPage({
    super.key,
    required this.user,
    required this.workSeconds,
  });

  final User user;
  final int workSeconds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: TimerReviewAppBar(
          user: user,
          workSeconds: workSeconds,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            const SakuraReviewScreen(),
            Expanded(child: TodoList(todoList: todoList))
          ],
        ),
      ),
      floatingActionButton: const TodoAddCircularButton(),
    );
  }
}
