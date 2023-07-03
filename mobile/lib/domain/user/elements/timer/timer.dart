import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
class Timer with _$Timer {
  const factory Timer({
    @Default({}) Map<String, List<Duration>> timerLog,
    @Default(25) int workTime,
    @Default(5) int breakTime,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}

//グラフに表示する際は大きさごとに並び替えるので大きい順に取得するものを作成する
abstract class ITimerLogRepository {
  Stream<Map<DateTime, Map<String, List<Duration>>>> fetchAllTodoList();
  void updateTimerLog(DateTime date, Map<String, List<Duration>> todoList);
}
