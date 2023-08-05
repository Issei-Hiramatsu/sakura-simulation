import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/domain/user_info/user_info.dart';
import '/component/local/todo_and_timer_app/timer/timer_card/timer_card.dart';
import '/component/shared/single/border_box/border_box.dart';
import '/component/shared/token/color/color.dart';
import 'elements/timer_setting_page/timer_setting_page.dart';

class TimerAppPage extends ConsumerWidget {
  const TimerAppPage({
    super.key,
    required this.user,
  });

  final UserInfo user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalBorderBox(
                borderColor: backgroundGray,
                borderWidth: 1,
                child: TimerCard(
                    text: 'ポモドーロタイマーを起動する',
                    workTime: user.workTime,
                    timerPage: TimerSettingPage(user: user)),
              );
            },
          ),
        ),
      ],
    );
  }
}
