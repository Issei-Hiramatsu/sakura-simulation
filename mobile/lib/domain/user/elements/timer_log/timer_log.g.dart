// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerLog _$$_TimerLogFromJson(Map<String, dynamic> json) => _$_TimerLog(
      statedAt: DateTime.parse(json['statedAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      workedType: json['workedType'] ?? '未設定',
      workedTime: json['workedTime'] == null
          ? const Duration(seconds: 0)
          : Duration(microseconds: json['workedTime'] as int),
    );

Map<String, dynamic> _$$_TimerLogToJson(_$_TimerLog instance) =>
    <String, dynamic>{
      'statedAt': instance.statedAt.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'workedType': instance.workedType,
      'workedTime': instance.workedTime.inMicroseconds,
    };
