import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/elements/timer_review_page/timer_review_page.dart';

import '/domain/user/user.dart';
import 'elements/timer_control_buttons/timer_control_buttons.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import 'hooks/use_pomodoro_timer.dart';
import '../../../../../../shared/token/navigator/navigator.dart';

//知りたいこと　initStateを使う意味
//DateTime.now()とは何者なのか
//Notifierで一瞬でできた　何者だ？
//追記 タイマーの機能自体は作成完了 コードの分離が終わっていない
//ConsumerStatefulWidgetはタイマーの部分 Hooksでタイマーの状態管理ができるようにするのが理想的だと思うのでやってみる。

class PomodoroTimer extends ConsumerWidget {
  const PomodoroTimer({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainSeconds = ref.watch(usePomodoroTimerProvider);
    final displayTime = Duration(seconds: remainSeconds)
        .toString()
        .substring(2, 7); //タイマーの領域を指定する
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpaceBox(height: 12.sp),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const TimerProgressIndicator(),
            Text(displayTime, style: displayLarge(black)),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: TimerControlButtons(
              startTimer: () => ref
                  .read(usePomodoroTimerProvider.notifier)
                  .startTimer(user.timerSettings!.workTime * 60),
              stopTimer: () =>
                  ref.read(usePomodoroTimerProvider.notifier).stopTimer(),
              resumeTimer: () => ref
                  .read(usePomodoroTimerProvider.notifier)
                  .resumeTimer(remainSeconds),
              resetTimer: () {
                ref
                    .read(usePomodoroTimerProvider.notifier)
                    .resetTimer(user.timerSettings!.workTime * 60);
                NavigatorPush(context,
                    page: TimerReviewPage(
                      user: user,
                      workSeconds: remainSeconds,
                    ));
              }),
        ),
      ],
    );
  }
}
