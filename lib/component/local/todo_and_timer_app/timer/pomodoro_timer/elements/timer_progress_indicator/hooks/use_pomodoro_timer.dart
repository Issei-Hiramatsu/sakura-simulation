//メモ
//circularインディケータの処理について
//　残りの時間/設定してあった時間がそのままになるのでそれを代入する。

import 'package:hooks_riverpod/hooks_riverpod.dart';

final timerAnimationParameterProvider =
    NotifierProvider<TimerAnimationParameter, double>(
  () => TimerAnimationParameter(),
);

class TimerAnimationParameter extends Notifier<double> {
  @override
  double build() => 0;

  void startTimerAnimation() => state = 1;

  void stopTimerAnimation() => state = 0; //タイマーを使用停止状態にする
}
