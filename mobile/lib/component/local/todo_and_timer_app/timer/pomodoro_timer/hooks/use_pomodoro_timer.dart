import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final timerProvider = StateNotifierProvider((ref) => TimerController());

class TimerController extends StateNotifier<DateTime> {
  Timer? _timer;

  TimerController() : super(DateTime.utc(0, 0));

  void startTimer(DateTime seconds) {
    state = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == DateTime.utc(0, 0)) {
        state.add(const Duration(seconds: 1));
      } else {
        timer.cancel();
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void resumeTimer() {
    if (_timer == null && state == DateTime.utc(0, 0)) {
      startTimer(state);
    }
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    state = DateTime.utc(0, 0);
  }

//TODO:　必要かどうかチェック
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
