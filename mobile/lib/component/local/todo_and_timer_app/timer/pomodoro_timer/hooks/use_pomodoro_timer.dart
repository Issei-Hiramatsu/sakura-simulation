import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final cooperationTimerProvider = StateProvider<int>((ref) => 0);

class PageWidget1 extends ConsumerStatefulWidget {
  const PageWidget1({Key? key}) : super(key: key);

  @override
  _PageWidget1State createState() => _PageWidget1State();
}

class _PageWidget1State extends ConsumerState<PageWidget1> {
  DateTime? _createTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState(); // initState 関数の実装は、super.initState を呼び出して開始する必要があります。
    _createTime = DateTime.now(); //変数_createTimeにDateTime.nowを代入
    _startTimer();
  }

  // タイマーのスタート
  void _startTimer() {
    final createTime = _createTime!.add(const Duration(minutes: 1)); // タイマーの時間
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final remain = createTime.difference(DateTime.now());
      if (remain > Duration.zero) {
        ref.read(cooperationTimerProvider.state).state =
            remain.inMilliseconds; //タイマーが動く
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(cooperationTimerProvider);
    final displayTime =
        Duration(milliseconds: timer).toString().substring(2, 10); // ミリ秒設定

    // 作成した時間
    final createTime = DateFormat('yyyy/MM/dd/HH:mm').format(_createTime!);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('残り時間'),
              const SizedBox(width: 10),
              Text(displayTime),
            ],
          ),
          const SizedBox(height: 20),
          Text(createTime),
        ],
      )),
    );
  }
}
