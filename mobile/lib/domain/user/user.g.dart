// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      userImagePath: json['userImagePath'] as String? ?? '',
      timerSettings: json['timerSettings'] == null
          ? null
          : TimerSettings.fromJson(
              json['timerSettings'] as Map<String, dynamic>),
      accountLevel:
          $enumDecodeNullable(_$AccountLevelEnumMap, json['accountLevel']) ??
              AccountLevel.guest,
      todoList: (json['todoList'] as List<dynamic>?)
              ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      firstTimeUsing: json['firstTimeUsing'] == null
          ? null
          : DateTime.parse(json['firstTimeUsing'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'userImagePath': instance.userImagePath,
      'timerSettings': instance.timerSettings,
      'accountLevel': _$AccountLevelEnumMap[instance.accountLevel]!,
      'todoList': instance.todoList,
      'firstTimeUsing': instance.firstTimeUsing?.toIso8601String(),
    };

const _$AccountLevelEnumMap = {
  AccountLevel.administrator: 'administrator',
  AccountLevel.premiumUser: 'premiumUser',
  AccountLevel.generalUser: 'generalUser',
  AccountLevel.guest: 'guest',
};
