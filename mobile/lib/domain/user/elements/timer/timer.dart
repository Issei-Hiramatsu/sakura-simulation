import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
class Timer with _$Timer {
  const factory Timer({
    @Default({}) Map<String, Duration> timerLog,
    @Default(25) int workTime,
    @Default(5) int breakTime,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}

//グラフに表示する際は大きさごとに並び替えるので大きい順に取得するものを作成する
abstract class ITimerLogRepository {
  Stream<Map<String, List<Duration>>> fetchAllTimerLog();
  void addTimerLog(
      DateTime date, String workedType, Duration workedTime, DateTime statedAt);
}
