// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerSettings _$$_TimerSettingsFromJson(Map<String, dynamic> json) =>
    _$_TimerSettings(
      workTime: json['workTime'] as int? ?? 25,
      breakTime: json['breakTime'] as int? ?? 5,
    );

Map<String, dynamic> _$$_TimerSettingsToJson(_$_TimerSettings instance) =>
    <String, dynamic>{
      'workTime': instance.workTime,
      'breakTime': instance.breakTime,
    };
