import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final usePomodoroTimerProvider = NotifierProvider<UsePomodoroTimer, int>(
  () => UsePomodoroTimer(),
);

class UsePomodoroTimer extends Notifier<int> {
  DateTime? _createTime;
  Timer? timer;
  @override
  int build() => 0;

  void startTimer(int seconds) {
    _createTime = DateTime.now().add(Duration(seconds: seconds));
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final remain = _createTime!.difference(DateTime.now());
        if (remain > Duration.zero) {
          state = remain.inSeconds;
        } else {}
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resumeTimer(int remainSeconds) {
    startTimer(remainSeconds);
  }

  void resetTimer(int seconds) {
    timer?.cancel();
    state = seconds;
  }
}
