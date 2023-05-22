import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/hooks/temp_todo_list.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../../domain/todo/todo.dart';
import '../../../../shared/token/color/color.dart';
import '../todo_radio_button/todo_radio_button.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 52.sp,
      decoration: BoxDecoration(
        color: backgroundLightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: TodoRadioButton(
            isSelected: todo.isCompleted,
            onPressed: () {
              ref
                  .read(tempTodoListProvider.notifier)
                  .toggleIsCompleted(todo.id);
            },
          ),
          trailing: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              ref.read(tempTodoListProvider.notifier).toggleIsFavorite(todo.id);
            },
            icon: Icon(
              todo.isFavorite ? Icons.star : Icons.star_outline,
              color: gray,
              size: 18.sp,
            ),
          ),
          title: Text(
            todo.todo,
            style: todo.isCompleted
                ? labelLargeLineThrough(gray)
                : labelLarge(white),
          ),
        ),
      ),
    );
  }
}