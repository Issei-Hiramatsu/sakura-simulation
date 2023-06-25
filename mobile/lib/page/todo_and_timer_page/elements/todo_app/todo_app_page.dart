import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../component/local/todo_and_timer_app/todo/hooks/use_todo_list.dart';
import '../../../../component/local/todo_and_timer_app/todo/todo_add_button.dart/todo_add_button.dart';
import '../../../../component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';

class TodoAppPage extends ConsumerWidget {
  const TodoAppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Column(
      children: [
        Expanded(
          child: TodoList(todoList: todoList),
        ),
        const TodoAddButton(),
      ],
    );
  }
}

//Firebase接続しないバージョンも欲しいなと思ったり