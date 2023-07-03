import '../domain/user/elements/timer/timer.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TimerLogUseCase {
  TimerLogUseCase({required this.timerLogRepository});
  final ITimerLogRepository timerLogRepository;

  Stream<Map<DateTime, Map<String, Duration>>> fetchAllTimerLog() {
    return timerLogRepository.fetchAllTimerLog();
  }

  void updateTodoList(
      {required DateTime date, required Map<String, Duration> timerLog}) {
    return timerLogRepository.updateTimerLog(date, timerLog);
  }
}
