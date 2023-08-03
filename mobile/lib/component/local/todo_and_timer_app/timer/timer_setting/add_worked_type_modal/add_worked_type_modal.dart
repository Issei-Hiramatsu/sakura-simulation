import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/timer_setting/hooks/use_worked_type_list.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/token/navigator/navigator.dart';

Future addWorkedTypeModal(BuildContext context, WidgetRef ref) {
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
            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
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
                SizedBox(width: 16.sp),
                Expanded(
                    child: TextField(
                  style: labelLarge(white),
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '集中すること',
                    hintStyle: labelLarge(gray),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: transparent),
                    ), //下部インディケータとボーダの非表示のため
                  ),
                  onSubmitted: (value) {
                    NavigatorPop(context);
                    if (controller.text.isEmpty == false) {
                      ref
                          .read(workedTypeListProvider.notifier)
                          .addWorkedType(controller.text);
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
