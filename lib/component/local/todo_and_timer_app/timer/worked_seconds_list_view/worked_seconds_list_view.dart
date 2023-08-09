import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/worked_seconds_list_view/elements/hooks/use_worked_seconds_list.dart';
import '../../../../../importer.dart';

import '../../../../../page/todo_and_timer_page/elements/timer_app/elements/timer_setting_page/timer_setting_page.dart';
import '../../../../shared/single/border_box/border_box.dart';
import 'elements/timer_card/timer_card.dart';

class WorkedSecondsListView extends ConsumerWidget {
  const WorkedSecondsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> workedSecondsList = ref.watch(workedSecondsListProvider);
    return ListView.builder(
      itemCount: workedSecondsList.length,
      itemBuilder: (BuildContext context, int index) {
        return HorizontalBorderBox(
          borderColor: backgroundGray,
          borderWidth: 1,
          child: TimerCard(
              text: 'ポモドーロタイマーを起動する',
              workTime: workedSecondsList[index],
              timerPage: TimerSettingPage(
                workedSeconds: workedSecondsList[index],
              )),
        );
      },
    );
  }
}
