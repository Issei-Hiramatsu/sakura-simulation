import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/todo_radio_button/todo_radio_button.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';

Future showAddTodoModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 450,
        padding: const EdgeInsets.only(top: 15),
        margin: const EdgeInsets.only(top: 64),
        decoration: BoxDecoration(
          color: backgroundLightBlack,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TodoRadioButton(isSelected: false),
            SpaceBox(width: 12),
            Expanded(child: TextField()),
          ],
        ),
      );
    },
    backgroundColor: transparent,
  );
}
