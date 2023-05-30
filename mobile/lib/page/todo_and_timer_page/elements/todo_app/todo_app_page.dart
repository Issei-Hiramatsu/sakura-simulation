import 'package:flutter/material.dart';

import '../../../../component/local/todo_and_timer_app/todo/todo_add_button.dart/todo_add_button.dart';
import '../../../../component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';
import '../../../../domain/user/user.dart';

class TodoAppPage extends StatelessWidget {
  const TodoAppPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TodoList(
            todoList: user.todoList['4/2']!,
          ),
        ),
        const TodoAddButton(),
      ],
    );
  }
}

//Firebase接続しないバージョンも欲しいなと思ったり