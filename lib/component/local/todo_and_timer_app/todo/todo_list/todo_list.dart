import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/todo/todo.dart';
import '../delete_confirmed_todo_modal/delete_confirmed_todo_modal.dart';
import 'elements/todo_card/todo_card.dart';
import 'elements/todo_slidable_action/todo_slidable_action.dart';

class TodoList extends ConsumerWidget {
  const TodoList({
    super.key,
    required this.todoList,
  });

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoSlidableAction(
          onDismissed: () =>
              deleteConfirmedTodoModal(context, ref, todoList[index]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: TodoCard(
              todo: todoList[index],
            ),
          ),
        );
      },
    );
  }
}
