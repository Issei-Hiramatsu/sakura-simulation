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
class PomodoroTimer extends ConsumerStatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

class PomodoroTimerState extends ConsumerState {
  final cooperationTimerProvider = StateProvider<int>((ref) => workTime * 60);

  DateTime? _createTime;
  Timer? timer;
  bool isRemaining = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    setState(() {
      isRemaining = true;
    });
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
        } else {
          setState(
            () {
              isRemaining = false;
            },
          );
        }
      },
    );
  }

  void stopTimer(remainSeconds) {
    timer?.cancel();
    setState(
      () {
        isRemaining = false;
      },
    );
  }

  void resumeTimer(remainSeconds) {}

  void resetTimer() {
    _createTime = DateTime.now().add(const Duration(minutes: workTime));
  }

  @override
  Widget build(BuildContext context) {
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
          child: isRemaining
              ? Row(
                  children: [
                    CircleElevatedButton(
                      size: 70.sp,
                      text: 'ラップ',
                      textStyle: labelLarge(white),
                      backgroundColor: backgroundGray,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    CircleElevatedButton(
                      size: 70.sp,
                      text: '一時停止',
                      textStyle: labelLarge(white),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        stopTimer(timer);
                      },
                    ),
                  ],
                )
              : Row(
                  children: [
                    CircleElevatedButton(
                      size: 70.sp,
                      text: 'リセット',
                      textStyle: labelLarge(white),
                      backgroundColor: backgroundGray,
                      onPressed: () {
                        resetTimer();
                      },
                    ),
                    const Spacer(),
                    CircleElevatedButton(
                      size: 70.sp,
                      text: '開始',
                      textStyle: labelLarge(white),
                      backgroundColor: Colors.green,
                      onPressed: () {
                        startTimer();
                      },
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
