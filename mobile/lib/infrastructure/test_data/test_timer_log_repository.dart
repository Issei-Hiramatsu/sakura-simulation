import '../../domain/user/elements/timer/timer.dart';

//テスト用のRepository Firebaseの接続を必要としない
final Map<DateTime, Map<String, List<Duration>>>
//
    testTimerLog = {
  DateTime(2023, 4, 1): {
    '集中時間': [
      const Duration(seconds: 1800),
      const Duration(seconds: 180),
    ],
  },
  DateTime(2023, 4, 3): {
    '集中時間': [
      const Duration(seconds: 1800),
      const Duration(seconds: 180),
    ],
  },
};

class TestTimerLogRepository extends ITimerLogRepository {
  @override
  Stream<Map<DateTime, Map<String, List<Duration>>>> fetchAllTimerLog() {
    return Stream.value(testTimerLog);
  }

  @override
  void updateTimerLog(
    DateTime date,
    String workedType,
    Duration workedTime,
  ) {
    testTimerLog[date]![workedType]!.add(workedTime);
  }
}
