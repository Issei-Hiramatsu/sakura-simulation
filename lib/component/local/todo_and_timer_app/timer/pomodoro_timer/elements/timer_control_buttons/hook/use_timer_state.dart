import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//この値をanimationで使うことを考えているためproviderにしている。
final timerStateProvider =
    StateProvider<TimerState>((ref) => TimerState.notStarted);

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
