import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings.freezed.dart';
part 'timer_settings.g.dart';

@freezed
class TimerSettings with _$TimerSettings {
  const factory TimerSettings({
    @Default(25) int workTime,
    @Default(5) int breakTime,
  }) = _TimerSettings;

  factory TimerSettings.fromJson(Map<String, dynamic> json) =>
      _$TimerSettingsFromJson(json);
}
