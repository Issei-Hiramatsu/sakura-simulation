import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
final testTimerLog = {
  DateTime(2023, 4, 1): [],
  DateTime(2023, 4, 3): [],
};

class TestTimerLogRepository extends ITimerLogRepository {
  @override
  Stream<Map<DateTime, List<Duration>>> fetchAllTimerLog() {
    return Stream.value(testTimerLog);
  }

  @override
  void updateTimerLog(DateTime date, List<Duration> TimerLog) {
    testTimerLog[date] = TimerLog;
  }
}
