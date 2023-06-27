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
    final remain = _createTime!.difference(DateTime.now());
    state = remain.inSeconds;
    //直すとしたらmiliSecondsでやれば解決する可能性がある
    //(20回以上押したら警告　"見つけてしまったか...このバグを(強者感）※タイマーは正常に動作しています"選択肢(気を取り直す, 延長)　何回か押すうちにどんどん文字が変わっていく　(お楽しみ要素として))
    //選択肢（200回目ぐらいで （気を取り直す, もうないよ）30回後 （気を取り直す, もうないって言ったじゃん） 100回後 (気を取り直す. あのさ　根気は認める(トロフィー付与))
    //何かお楽しみ要素入れようとは思っていたけど せっかくの機会なので
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
