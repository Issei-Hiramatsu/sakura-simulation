import 'package:flutter/material.dart';

import '../../../../component/local/todo_and_timer_app/todo/todo_add_button.dart/todo_add_button.dart';
import '../../../../component/local/todo_and_timer_app/todo/todo_card/todo_card.dart';

class TodoAppPage extends StatelessWidget {
  const TodoAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: TodoCard(text: 'aaa'),
              );
            },
          ),
        ),
        const TodoAddButton(),
      ],
    );
  }
}
