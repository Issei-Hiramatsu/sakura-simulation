import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/todo_list/elements/todo_card/elements/todo_radio_button/todo_radio_button.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

import '../../hooks/temp_todo_list.dart';
import '../../../../../shared/token/navigator/navigator.dart';
import '../../../../../shared/token/text_style/text_style.dart';

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
                        borderSide: BorderSide(
                            width: 0,
                            color: transparent)), //下部インディケータとボーダの非表示のため
                  ),
                  onSubmitted: (value) {
                    NavigatorPop(context);
                    ref
                        .read(tempTodoListProvider.notifier)
                        .addTodoList(controller.text);
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
