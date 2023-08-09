import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../domain/todo/todo.dart';
import '../../../hooks/use_todo_list.dart';
import 'elements/favorite_icon_button/favorite_icon_button.dart';
import 'elements/todo_radio_button/todo_radio_button.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 58.sp,
      decoration: BoxDecoration(
        color: backgroundLightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 18.sp),
        leading: TodoRadioButton(
          isSelected: todo.isCompleted,
          onPressed: () {
            ref.read(todoListProvider.notifier).toggleIsCompleted(todo);
          },
        ),
        title: Text(
          todo.title,
          style: todo.isCompleted
              ? labelLargeLineThrough(gray)
              : labelLarge(white),
        ),
        trailing: FavoriteIconButton(
          todo: todo,
        ),
      ),
    );
  }
}
