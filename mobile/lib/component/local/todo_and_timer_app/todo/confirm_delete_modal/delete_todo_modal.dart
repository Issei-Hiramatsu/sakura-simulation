import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/user/elements/todo/todo.dart';
import '../../../../../importer.dart';
import '../../../../shared/token/navigator/navigator.dart';
import '../hooks/todo_list.dart';

void deleteTodoModal(BuildContext context, WidgetRef ref, Todo todo) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          message: Text('"${todo.title}"は完全に削除されます'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                ref.read(todoListProvider.notifier).deleteTodoList(todo.id);
                NavigatorPop(context);
              },
              child: const Text(
                'タスクの削除',
                style: TextStyle(color: tertiary),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              NavigatorPop(context);
            },
            child: const Text('キャンセル'),
          ),
        );
      });
}
