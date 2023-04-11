import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo_card/todo_card.dart';

import '../../../component/local/todo_and_timer_app/todo_add_button.dart/todo_add_button.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

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
