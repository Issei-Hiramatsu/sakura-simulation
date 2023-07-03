import '../../domain/user/elements/timer/timer.dart';

//テスト用のRepository Firebaseの接続を必要としない
final Map<DateTime, Map<String, Duration>>
//
    testTimerLog = {
  DateTime(2023, 4, 1): {
    'Flutter': const Duration(seconds: 1800),
    'Flutter2': const Duration(seconds: 180),
    'Flutter3': const Duration(seconds: 60),
  },
  DateTime(2023, 4, 3): {
    'Flutter': const Duration(seconds: 1800),
    'Flutter2': const Duration(seconds: 180),
    'Flutter3': const Duration(seconds: 60),
  },
};

class TestTimerLogRepository extends ITimerLogRepository {
  @override
  Stream<Map<DateTime, Map<String, Duration>>> fetchAllTimerLog() {
    return Stream.value(testTimerLog);
  }

  @override
  void updateTimerLog(DateTime date, Map<String, Duration> timerLog) {
    testTimerLog[date] = timerLog;
  }
}
