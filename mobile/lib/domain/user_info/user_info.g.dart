// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      userImagePath: json['userImagePath'] as String? ?? '',
      workTime: json['workTime'] as int? ?? 25,
      breakTime: json['breakTime'] as int? ?? 5,
      accountLevel:
          $enumDecodeNullable(_$AccountLevelEnumMap, json['accountLevel']) ??
              AccountLevel.guest,
      firstTimeUsing: DateTime.parse(json['firstTimeUsing'] as String),
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'userImagePath': instance.userImagePath,
      'workTime': instance.workTime,
      'breakTime': instance.breakTime,
      'accountLevel': _$AccountLevelEnumMap[instance.accountLevel]!,
      'firstTimeUsing': instance.firstTimeUsing.toIso8601String(),
    };

const _$AccountLevelEnumMap = {
  AccountLevel.administrator: 'administrator',
  AccountLevel.premiumUser: 'premiumUser',
  AccountLevel.generalUser: 'generalUser',
  AccountLevel.guest: 'guest',
};
