import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../../../shared/single/button/circle_button/circle_button.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import 'hooks/temp_user_settings.dart';

//知りたいこと　initStateを使う意味
//DateTime.now()とは何者なのか
//Notifierで一瞬でできた　何者だ？
//追記 タイマーの機能自体は作成完了 コードの分離が終わっていない
//ConsumerStatefulWidgetはタイマーの部分 Hooksでタイマーの状態管理ができるようにするのが理想的だと思うのでやってみる。
enum TimerState {
  notStarted(
    '開始',
    Colors.white,
    Colors.green,
  ),
  running(
    '一時停止',
    Colors.white,
    Colors.orange,
  ),
  paused(
    '再開',
    Colors.white,
    Colors.green,
  );

  final String displayButtonText;
  final Color textColor;
  final Color backgroundColor;

  const TimerState(
    this.displayButtonText,
    this.textColor,
    this.backgroundColor,
  );
}

class PomodoroTimer extends ConsumerStatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

class PomodoroTimerState extends ConsumerState {
  final cooperationTimerProvider = StateProvider<int>((ref) => workTime * 60);
  final timerStateProvider =
      StateProvider<TimerState>((ref) => TimerState.notStarted);

  DateTime? _createTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  void startTimer(int seconds) {
    _createTime = DateTime.now().add(Duration(seconds: seconds));
    ref.read(timerStateProvider.notifier).state = TimerState.running;
    final remain = _createTime!.difference(DateTime.now());
    ref.read(cooperationTimerProvider.notifier).state = remain.inSeconds;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final remain = _createTime!.difference(DateTime.now());
        if (remain > Duration.zero) {
          ref.read(cooperationTimerProvider.notifier).state = remain.inSeconds;
        } else {}
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
    ref.read(timerStateProvider.notifier).state = TimerState.paused;
  }

  void resumeTimer(int remainSeconds) {
    startTimer(remainSeconds);
    ref.read(timerStateProvider.notifier).state = TimerState.running;
  }

  void resetTimer() {
    timer?.cancel();
    ref.read(cooperationTimerProvider.notifier).state = workTime * 60;
    ref.read(timerStateProvider.notifier).state = TimerState.notStarted;
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timerStateProvider);
    final timer = ref.watch(cooperationTimerProvider);
    final displayTime =
        Duration(seconds: timer).toString().substring(2, 7); //タイマーの領域を指定する
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
            child: Row(
              children: [
                CircleElevatedButton(
                  size: 70.sp,
                  text: 'キャンセル',
                  textStyle: labelLarge(white),
                  backgroundColor: backgroundGray,
                  onPressed: timerState == TimerState.notStarted
                      ? null
                      : () {
                          resetTimer();
                        },
                ),
                const Spacer(),
                CircleElevatedButton(
                  size: 70.sp,
                  text: timerState.displayButtonText,
                  textStyle: labelLarge(timerState.textColor),
                  backgroundColor: timerState.backgroundColor,
                  onPressed: () {
                    switch (timerState) {
                      case TimerState.notStarted:
                        return startTimer(workTime * 60);
                      case TimerState.running:
                        return stopTimer();
                      case TimerState.paused:
                        return resumeTimer(
                          ref.read(cooperationTimerProvider.notifier).state,
                        );
                    }
                  },
                ),
              ],
            )),
      ],
    );
  }
}
