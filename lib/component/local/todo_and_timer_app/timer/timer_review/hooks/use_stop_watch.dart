import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final useStopUseStopWatchProvider = NotifierProvider<UseStopWatch, Duration>(
  () => UseStopWatch(),
);

class UseStopWatch extends Notifier<Duration> {
  @override
  Duration build() => const Duration(seconds: 0);
  final Stopwatch stopwatch = Stopwatch();
  final dul = const Duration(seconds: 1);

  void startTimer() {
    stopwatch.start();
    Timer(dul, keepRunning);
  }

  void resetTimer() {
    state = const Duration(seconds: 0);
    stopwatch.stop();
    stopwatch.reset();
  }

  void keepRunning() {
    if (stopwatch.isRunning) {
      Timer(dul, keepRunning);
      state = stopwatch.elapsed;
    }
  }
}
