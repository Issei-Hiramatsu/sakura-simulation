import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_worked_type_list.dart';
import '/page/todo_and_timer_page/elements/timer_app/elements/pomodoro_timer_page/pomodoro_timer_page.dart';
import 'elements/timer_setting_card/timer_setting_card.dart';
import '../../pomodoro_timer/elements/timer_control_buttons/hook/use_timer_state.dart';
import '../../pomodoro_timer/hooks/use_pomodoro_timer.dart';
import '../../../../../shared/token/navigator/navigator.dart';

class TimerSettingListView extends ConsumerWidget {
  const TimerSettingListView({super.key, required this.workedSeconds});

  final int workedSeconds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> workedTypeList = ref.watch(workedTypeListProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: workedTypeList.length,
            itemBuilder: (BuildContext context, int index) {
              final workedType = workedTypeList[index];
              return TimerSettingCard(
                text: workedType,
                onTap: () {
                  ref.read(timerStateProvider.notifier).state =
                      TimerState.notStarted;
                  ref
                      .read(usePomodoroTimerProvider.notifier)
                      .resetTimer(workedSeconds * 60);
                  NavigatorPush(
                    context,
                    page: PomodoroTimerPage(
                      workedSeconds: workedSeconds,
                      workedType: workedType,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
