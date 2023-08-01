import '../domain/user/elements/timer/timer.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TimerLogUseCase {
  TimerLogUseCase({required this.timerLogRepository});
  final ITimerLogRepository timerLogRepository;

  Stream<Map<String, List<dynamic>>> fetchAllTimerLog() {
    return timerLogRepository.fetchAllTimerLog();
  }

  void addTimerLog({
    required DateTime date,
    required String workedType,
    required Duration workedTime,
  }) {
    return timerLogRepository.addTimerLog(date, workedType, workedTime);
  }
}
