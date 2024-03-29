import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_log.freezed.dart';
part 'timer_log.g.dart';

@freezed
class TimerLog with _$TimerLog {
  const factory TimerLog({
    required DateTime statedAt,
    DateTime? endAt,
    @Default('集中') workedType,
    @Default(Duration(seconds: 0)) Duration workedTime,
  }) = _TimerLog;

  factory TimerLog.fromJson(Map<String, dynamic> json) =>
      _$TimerLogFromJson(json);
}

abstract class ITimerLogRepository {
  Stream<Map<String, List<TimerLog>>> fetchAllTimerLog();
  Stream<List<String>> fetchAllTimerWorkedType();
  void addTimerLog(TimerLog timerLog);
  void addWorkedType(String workedType);
  void addWorkedSeconds(int workedSeconds);
  Stream<List<int>> fetchAllWorkedSeconds();
}
