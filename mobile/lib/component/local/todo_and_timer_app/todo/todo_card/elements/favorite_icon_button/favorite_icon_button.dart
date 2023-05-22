import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../domain/todo/todo.dart';
import '../../../../../../shared/token/color/color.dart';
import '../../../hooks/temp_todo_list.dart';

class FavoriteIconButton extends HookConsumerWidget {
  const FavoriteIconButton({
    super.key,
    required this.todo,
  });
  final Todo todo; //現状Todoでしか使われていないためTodo専用として活用する

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var iconSize = useState(20.sp);
    return GestureDetector(
      onTap: () {
        ref.read(tempTodoListProvider.notifier).toggleIsFavorite(todo.id);
      },
      onLongPressStart: ((details) {
        iconSize.value = 16.sp;
      }),
      onLongPressUp: () {
        ref.read(tempTodoListProvider.notifier).toggleIsFavorite(todo.id);
        iconSize.value = 20.sp;
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            ref.read(tempTodoListProvider.notifier).toggleIsFavorite(todo.id);
          },
          icon: Icon(
            todo.isFavorite ? Icons.star : Icons.star_outline,
            color: gray,
            size: iconSize.value,
          ),
        ),
      ),
    );
  }
}
