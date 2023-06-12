//1秒ごとに足されるStopWatchにならないため無効化する.stable時にこのコードが使用されていない場合このコードは破棄しても良い。

// import 'dart:async';

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final useStopWatchProvider = NotifierProvider<UseStopWatch, int>(
//   () => UseStopWatch(),
// );

// class UseStopWatch extends Notifier<int> {
//   Timer? timer;
//   @override
//   int build() => 0;

//   void startTimer() {
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         state++;
//       },
//     );
//   }

//   void stopTimer() {
//     timer?.cancel();
//     state = 0;
//   }
// }
