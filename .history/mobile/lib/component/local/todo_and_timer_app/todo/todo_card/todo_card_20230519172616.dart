import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/hooks/temp_todo_list.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/token/color/color.dart';
import '../todo_radio_button/todo_radio_button.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({
    super.key,
    required this.id,
    required this.text,
    required this.isCompleted,
    required this.isFavorite,
  });

  final String text;
  final bool isCompleted;
  final bool isFavorite;
  final String id;

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
            isSelected: isCompleted,
            onPressed: () {
              ref.read(tempTodoListProvider.notifier).toggleIsCompleted(id);
            },
          ),
          trailing: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              ref.read(tempTodoListProvider.notifier).toggleIsFavorite(id);
            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_outline,
              color: gray,
              size: 18.sp,
            ),
          ),
          title: Text(
            text,
            style:
                isCompleted ? labelLargeLineThrough(gray) : labelLarge(white),
          ),
        ),
      ),
    );
  }
}
