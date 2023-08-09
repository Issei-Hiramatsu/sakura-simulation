import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'elements/add_todo_modal.dart';

import '../../../../shared/single/button/floating_circle_button/floating_circle_button.dart';

class TodoAddCircularButton extends ConsumerWidget {
  const TodoAddCircularButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingCircleButton(
      onPressed: () {
        showAddTodoModal(context, ref);
      },
      icon: const Icon(Icons.add),
    );
  }
}
