import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/todo_radio_button/todo_radio_button.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

import '../../../../../shared/token/text_style/text_style.dart';

Future showAddTodoModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: TodoRadioButton(isSelected: false),
                ),
                Expanded(
                    child: TextField(
                  style: labelLarge(white),
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'タスクの追加',
                      hintStyle: labelLarge(gray),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0, color: backgroundLightBlack))),
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
