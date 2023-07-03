import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
class Timer with _$Timer {
  const factory Timer({
    @Default([]) List<Duration> timerLog,
    @Default(25) int workTime,
    @Default(5) int breakTime,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}
