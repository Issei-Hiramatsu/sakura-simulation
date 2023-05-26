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
      firstTimeUsing: json['firstTimeUsing'] == null
          ? null
          : DateTime.parse(json['firstTimeUsing'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'userImagePath': instance.userImagePath,
      'firstTimeUsing': instance.firstTimeUsing?.toIso8601String(),
    };
