// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImagePath => throw _privateConstructorUsedError;
  AccountLevel get accountLevel => throw _privateConstructorUsedError;
  DateTime get firstTimeUsing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String userImagePath,
      AccountLevel accountLevel,
      DateTime firstTimeUsing});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? userImagePath = null,
    Object? accountLevel = null,
    Object? firstTimeUsing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImagePath: null == userImagePath
          ? _value.userImagePath
          : userImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      accountLevel: null == accountLevel
          ? _value.accountLevel
          : accountLevel // ignore: cast_nullable_to_non_nullable
              as AccountLevel,
      firstTimeUsing: null == firstTimeUsing
          ? _value.firstTimeUsing
          : firstTimeUsing // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSettingsCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$_UserSettingsCopyWith(
          _$_UserSettings value, $Res Function(_$_UserSettings) then) =
      __$$_UserSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String userImagePath,
      AccountLevel accountLevel,
      DateTime firstTimeUsing});
}

/// @nodoc
class __$$_UserSettingsCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$_UserSettings>
    implements _$$_UserSettingsCopyWith<$Res> {
  __$$_UserSettingsCopyWithImpl(
      _$_UserSettings _value, $Res Function(_$_UserSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? userImagePath = null,
    Object? accountLevel = null,
    Object? firstTimeUsing = null,
  }) {
    return _then(_$_UserSettings(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImagePath: null == userImagePath
          ? _value.userImagePath
          : userImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      accountLevel: null == accountLevel
          ? _value.accountLevel
          : accountLevel // ignore: cast_nullable_to_non_nullable
              as AccountLevel,
      firstTimeUsing: null == firstTimeUsing
          ? _value.firstTimeUsing
          : firstTimeUsing // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettings implements _UserSettings {
  const _$_UserSettings(
      {this.id = '',
      this.email = '',
      this.userName = '',
      this.userImagePath = '',
      this.accountLevel = AccountLevel.guest,
      required this.firstTimeUsing});

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) =>
      _$$_UserSettingsFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String userImagePath;
  @override
  @JsonKey()
  final AccountLevel accountLevel;
  @override
  final DateTime firstTimeUsing;

  @override
  String toString() {
    return 'UserSettings(id: $id, email: $email, userName: $userName, userImagePath: $userImagePath, accountLevel: $accountLevel, firstTimeUsing: $firstTimeUsing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSettings &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImagePath, userImagePath) ||
                other.userImagePath == userImagePath) &&
            (identical(other.accountLevel, accountLevel) ||
                other.accountLevel == accountLevel) &&
            (identical(other.firstTimeUsing, firstTimeUsing) ||
                other.firstTimeUsing == firstTimeUsing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, userName,
      userImagePath, accountLevel, firstTimeUsing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSettingsCopyWith<_$_UserSettings> get copyWith =>
      __$$_UserSettingsCopyWithImpl<_$_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingsToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {final String id,
      final String email,
      final String userName,
      final String userImagePath,
      final AccountLevel accountLevel,
      required final DateTime firstTimeUsing}) = _$_UserSettings;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$_UserSettings.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get userName;
  @override
  String get userImagePath;
  @override
  AccountLevel get accountLevel;
  @override
  DateTime get firstTimeUsing;
  @override
  @JsonKey(ignore: true)
  _$$_UserSettingsCopyWith<_$_UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
