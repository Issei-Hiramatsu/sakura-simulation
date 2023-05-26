import 'package:flutter/material.dart';

import 'elements/todo_card/todo_card.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todoList,
  });

  final List todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: TodoCard(
            todo: todoList[index],
          ),
        );
      },
    );
  }
}
