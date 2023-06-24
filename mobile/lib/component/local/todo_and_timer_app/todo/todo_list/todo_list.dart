import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../domain/user/elements/todo/todo.dart';
import '../../../../../importer.dart';
import 'elements/todo_card/todo_card.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todoList,
  });

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          key: UniqueKey(),
          closeOnScroll: true,
          endActionPane: ActionPane(
            extentRatio: 0.25,
            dismissible: DismissiblePane(onDismissed: () {}),
            motion: const ScrollMotion(),
            children: const [
              SlidableAction(
                onPressed: null, //TODO: 後で 推したら削除のmodalが出現するようにする
                backgroundColor: tertiary,
                foregroundColor: white,
                icon: Icons.delete_outline,
              ),
            ],
          ),
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
