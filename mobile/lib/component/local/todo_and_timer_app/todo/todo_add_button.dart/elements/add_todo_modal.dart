import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/token/navigator/navigator.dart';

import '../../hooks/use_todo_list.dart';
import '../../todo_list/elements/todo_card/elements/todo_radio_button/todo_radio_button.dart';

Future showAddTodoModal(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
      final controller = TextEditingController();
      return SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomSpace),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundLightBlack,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 22, //TodoAddButtonがちょうど見えなくなる高さ
                  ),
                  child: TodoRadioButton(
                    isSelected: false,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                    child: TextField(
                  style: labelLarge(white),
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'タスクの追加',
                    hintStyle: labelLarge(gray),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: transparent),
                    ), //下部インディケータとボーダの非表示のため
                  ),
                  onSubmitted: (value) {
                    NavigatorPop(context);
                    if (controller.text.isEmpty == false) {
                      ref
                          .read(todoListProvider.notifier)
                          .addTodoList(controller.text);
                    }
                    controller.clear();
                  },
                )),
              ],
            ),
          ),
        ),
      );
    },
    backgroundColor: transparent,
  );
}
