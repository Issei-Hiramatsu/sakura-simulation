import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/hooks/temp_todo_list.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/todo_card/elements/favorite_icon_button/favorite_icon_button.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../../domain/todo/todo.dart';
import '../../../../shared/token/color/color.dart';
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
              ref
                  .read(tempTodoListProvider.notifier)
                  .toggleIsCompleted(todo.id);
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
          )),
    );
  }
}
