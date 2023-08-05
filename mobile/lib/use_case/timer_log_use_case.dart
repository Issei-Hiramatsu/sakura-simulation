//抽象クラスを継承したuseCase domainとUIを接続する
import '../domain/timer_log/timer_log.dart';

class TimerLogUseCase {
  TimerLogUseCase({required this.timerLogRepository});
  final ITimerLogRepository timerLogRepository;

  Stream<Map<String, List<TimerLog>>> fetchAllTimerLog() {
    return timerLogRepository.fetchAllTimerLog();
  }

  Stream<List<String>> fetchAllTimerWorkedType() {
    return timerLogRepository.fetchAllTimerWorkedType();
  }

  void addTimerLog({
    required TimerLog timerLog,
  }) {
    return timerLogRepository.addTimerLog(timerLog);
  }

  void addWorkedType({
    required String workedType,
  }) {
    return timerLogRepository.addWorkedType(workedType);
  }
}
