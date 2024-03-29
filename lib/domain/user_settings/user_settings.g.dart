// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSettings _$$_UserSettingsFromJson(Map<String, dynamic> json) =>
    _$_UserSettings(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      userImagePath: json['userImagePath'] as String? ?? '',
      accountLevel:
          $enumDecodeNullable(_$AccountLevelEnumMap, json['accountLevel']) ??
              AccountLevel.guest,
      firstTimeUsing: DateTime.parse(json['firstTimeUsing'] as String),
    );

Map<String, dynamic> _$$_UserSettingsToJson(_$_UserSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'userImagePath': instance.userImagePath,
      'accountLevel': _$AccountLevelEnumMap[instance.accountLevel]!,
      'firstTimeUsing': instance.firstTimeUsing.toIso8601String(),
    };

const _$AccountLevelEnumMap = {
  AccountLevel.administrator: 'administrator',
  AccountLevel.premiumUser: 'premiumUser',
  AccountLevel.generalUser: 'generalUser',
  AccountLevel.guest: 'guest',
};
