import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/todo_app/hooks/temp_todo_list.dart';

import '../../../../component/local/todo_and_timer_app/todo/todo_add_button.dart/todo_add_button.dart';
import '../../../../component/local/todo_and_timer_app/todo/todo_card/todo_card.dart';

class TodoAppPage extends ConsumerWidget {
  const TodoAppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(tempTodoListProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: TodoCard(
                  text: todoList[index].todo.toString(),
                  isSelected: true,
                ),
              );
            },
          ),
        ),
        const TodoAddButton(),
      ],
    );
  }
}
