// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdPeriod: DateTime.parse(json['createdPeriod'] as String),
      completedPeriod: json['completedPeriod'] == null
          ? null
          : DateTime.parse(json['completedPeriod'] as String),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'isFavorite': instance.isFavorite,
      'createdPeriod': instance.createdPeriod.toIso8601String(),
      'completedPeriod': instance.completedPeriod?.toIso8601String(),
    };
