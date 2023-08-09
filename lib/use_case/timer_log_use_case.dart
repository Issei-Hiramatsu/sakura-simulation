//抽象クラスを継承したuseCase domainとUIを接続する
import '../domain/timer_log/timer_log.dart';

class TimerLogUseCase {
  TimerLogUseCase({required this.timerLogRepository});
  final ITimerLogRepository timerLogRepository;

//timerLog
  Stream<Map<String, List<TimerLog>>> fetchAllTimerLog() {
    return timerLogRepository.fetchAllTimerLog();
  }

  void addTimerLog({
    required TimerLog timerLog,
  }) {
    return timerLogRepository.addTimerLog(timerLog);
  }

//workedTyp
  Stream<List<String>> fetchAllTimerWorkedType() {
    return timerLogRepository.fetchAllTimerWorkedType();
  }

  void addWorkedType({
    required String workedType,
  }) {
    return timerLogRepository.addWorkedType(workedType);
  }

//workedSeconds
  Stream<List<int>> fetchAllWorkedSeconds() {
    return timerLogRepository.fetchAllWorkedSeconds();
  }

  void addWorkedSeconds({
    required int workedSeconds,
  }) {
    return timerLogRepository.addWorkedSeconds(workedSeconds);
  }
}
