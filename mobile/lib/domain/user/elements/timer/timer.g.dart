// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timer _$$_TimerFromJson(Map<String, dynamic> json) => _$_Timer(
      timerLog: (json['timerLog'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Duration(microseconds: e as int)),
          ) ??
          const {},
      workTime: json['workTime'] as int? ?? 25,
      breakTime: json['breakTime'] as int? ?? 5,
    );

Map<String, dynamic> _$$_TimerToJson(_$_Timer instance) => <String, dynamic>{
      'timerLog':
          instance.timerLog.map((k, e) => MapEntry(k, e.inMicroseconds)),
      'workTime': instance.workTime,
      'breakTime': instance.breakTime,
    };
