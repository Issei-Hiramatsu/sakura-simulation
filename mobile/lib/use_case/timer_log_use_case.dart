import '../domain/user/elements/timer/timer.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TimerLogUseCase {
  TimerLogUseCase({required this.timerLogRepository});
  final ITimerLogRepository timerLogRepository;

  Stream<Map<String, List<Duration>>> fetchAllTimerLog() {
    return timerLogRepository.fetchAllTimerLog();
  }

  void addTimerLog({
    required DateTime date,
    required String workedType,
    required Duration workedTime,
    required DateTime statedAt,
  }) {
    return timerLogRepository.addTimerLog(
        date, workedType, workedTime, statedAt);
  }
}
