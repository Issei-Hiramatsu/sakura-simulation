import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/elements/pomodoro_timer_page/pomodoro_timer_page.dart';

import '/component/local/todo_and_timer_app/timer/timer_card/elements/pomodoro_timer/elements/timer_control_buttons/hook/use_timer_state.dart';
import '/component/local/todo_and_timer_app/timer/timer_card/elements/pomodoro_timer/hooks/use_pomodoro_timer.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';
import '/component/shared/token/navigator/navigator.dart';
import '/domain/user/user.dart';
import '/importer.dart';
import 'hooks/fetch_timer_worked_type.dart';
import '/component/local/todo_and_timer_app/timer/timer_setting_card/timer_setting_card.dart';

class TimerSettingPage extends ConsumerWidget {
  const TimerSettingPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          automaticallyImplyLeading: true,
          titleText: '選択',
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
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
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
              ),
        ],
      ),
    );
  }
}
