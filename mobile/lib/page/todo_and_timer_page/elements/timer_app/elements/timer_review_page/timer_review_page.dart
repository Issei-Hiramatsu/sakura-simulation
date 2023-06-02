import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/shared/token/navigator/navigator.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:sakura_simulation/page/sakura_simulation_app.dart';

import '/component/local/todo_and_timer_app/todo/todo_add_button.dart/elements/add_todo_modal.dart';
import '/component/local/todo_and_timer_app/todo/hooks/todo_list.dart';
import '/component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';
import '/component/shared/single/button/floating_circle_button/floating_circle_button.dart';
import '/component/shared/single/icon_image/icon_image.dart';
import '/domain/user/user.dart';

class TimerReviewPage extends ConsumerWidget {
  const TimerReviewPage({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          leading: IconButton(
              onPressed: () {
                NavigatorPushReplacement(context,
                    page: const SakuraSimulationApp(pageIndex: 2));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: white,
              )),
          titleText: 'タイマー終了',
          textStyle: titleMedium(white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text('お疲れ様です！', style: title2Regular(black)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
              child: Text(
                'タスクを精算し次のタスクを準備してから\n休憩に行くとスムーズに始められますよ',
                style: caption1Regular(black),
                textAlign: TextAlign.center,
              ),
            ),
            SpaceBox(height: 8.sp),
            const IconImage(assets: 'assets/images/sakura_icon.jpg'),
            SpaceBox(height: 8.sp),
            Expanded(child: TodoList(todoList: todoList)),
          ],
        ),
      ),
      floatingActionButton: FloatingCircleButton(
        onPressed: () {
          showAddTodoModal(context, ref);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
