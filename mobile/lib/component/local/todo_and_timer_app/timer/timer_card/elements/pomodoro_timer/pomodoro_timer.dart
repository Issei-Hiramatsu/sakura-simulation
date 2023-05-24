import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../../../shared/single/button/circle_button/circle_button.dart';
import 'elements/timer_progress_indicator/hooks/use_pomodoro_timer.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import 'hooks/temp_user_settings.dart';

//知りたいこと　initStateを使う意味
//DateTime.now()とは何者なのか
//Notifierで一瞬でできた　何者だ？
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

  void startTimer() {
    ref.read(timerStateProvider.notifier).state = TimerState.running;
    _createTime = DateTime.now().add(const Duration(minutes: workTime));
    final remain = _createTime!.difference(DateTime.now());
    ref.read(cooperationTimerProvider.notifier).state = remain.inSeconds;
    ref.read(timerAnimationParameterProvider.notifier).startTimerAnimation();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remain > Duration.zero) {
          final remain = _createTime!.difference(DateTime.now());
          ref.read(cooperationTimerProvider.notifier).state = remain.inSeconds;
        } else {}
      },
    );
  }

  void stopTimer(remainSeconds) {
    timer?.cancel();
    ref.read(timerStateProvider.notifier).state = TimerState.paused;
  }

  void resumeTimer(remainSeconds) {}

  void resetTimer() {
    _createTime = DateTime.now().add(const Duration(minutes: workTime));
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
                        return startTimer();
                      case TimerState.running:
                        return stopTimer(2);
                      case TimerState.paused:
                        return startTimer();
                    }
                  },
                ),
              ],
            )),
      ],
    );
  }
}
