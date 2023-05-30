// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountLevel _$$_AccountLevelFromJson(Map<String, dynamic> json) =>
    _$_AccountLevel(
      administrator: (json['administrator'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      premiumUser: (json['premiumUser'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      generalUser: (json['generalUser'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      guest: (json['guest'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AccountLevelToJson(_$_AccountLevel instance) =>
    <String, dynamic>{
      'administrator': instance.administrator,
      'premiumUser': instance.premiumUser,
      'generalUser': instance.generalUser,
      'guest': instance.guest,
    };
