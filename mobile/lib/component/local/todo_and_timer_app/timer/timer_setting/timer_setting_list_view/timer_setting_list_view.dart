import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/domain/user/user.dart';
import '/page/todo_and_timer_page/elements/timer_app/elements/pomodoro_timer_page/pomodoro_timer_page.dart';
import 'elements/timer_setting_card/timer_setting_card.dart';
import 'hooks/fetch_timer_worked_type.dart';
import '../../pomodoro_timer/elements/timer_control_buttons/hook/use_timer_state.dart';
import '../../pomodoro_timer/hooks/use_pomodoro_timer.dart';
import '../../../../../shared/single/shared_circular_progress_indicator/shared_circular_progress_indicator.dart';
import '../../../../../shared/token/navigator/navigator.dart';

class TimerSettingListView extends ConsumerWidget {
  const TimerSettingListView({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ref.watch(fetchAllTimerWorkedType(context)).when(
              data: (dataList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final workedType = dataList[index];
                      return TimerSettingCard(
                        text: workedType,
                        onTap: () {
                          ref.read(timerStateProvider.notifier).state =
                              TimerState.notStarted;
                          ref
                              .read(usePomodoroTimerProvider.notifier)
                              .resetTimer(user.workTime * 60);
                          NavigatorPush(
                            context,
                            page: PomodoroTimerPage(
                              user: user,
                              workedType: workedType,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const SharedCircularProgressIndicator(),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
            ),
      ],
    );
  }
}
