import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'elements/add_todo_modal.dart';

class TodoAddSquareButton extends ConsumerWidget {
  const TodoAddSquareButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 400.sp,
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
      child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), //角の丸み
          ),
          backgroundColor: backgroundLightBlack,
          child: Row(
            children: [
              SizedBox(width: 12.sp),
              const Icon(Icons.add),
              SizedBox(width: 12.sp),
              Text('タスクの追加', style: bodyRegular(white)),
            ],
          ),
          onPressed: () {
            showAddTodoModal(context, ref);
          }),
    );
  }
}
