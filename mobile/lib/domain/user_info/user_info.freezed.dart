// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImagePath => throw _privateConstructorUsedError;
  int get workTime => throw _privateConstructorUsedError;
  int get breakTime => throw _privateConstructorUsedError;
  AccountLevel get accountLevel => throw _privateConstructorUsedError;
  DateTime get firstTimeUsing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {int id,
      String email,
      String userName,
      String userImagePath,
      int workTime,
      int breakTime,
      AccountLevel accountLevel,
      DateTime firstTimeUsing});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

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
    Object? workTime = null,
    Object? breakTime = null,
    Object? accountLevel = null,
    Object? firstTimeUsing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String userName,
      String userImagePath,
      int workTime,
      int breakTime,
      AccountLevel accountLevel,
      DateTime firstTimeUsing});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? userImagePath = null,
    Object? workTime = null,
    Object? breakTime = null,
    Object? accountLevel = null,
    Object? firstTimeUsing = null,
  }) {
    return _then(_$_UserInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {this.id = 0,
      this.email = '',
      this.userName = '',
      this.userImagePath = '',
      this.workTime = 25,
      this.breakTime = 5,
      this.accountLevel = AccountLevel.guest,
      required this.firstTimeUsing});

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  @JsonKey()
  final int id;
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
  final int workTime;
  @override
  @JsonKey()
  final int breakTime;
  @override
  @JsonKey()
  final AccountLevel accountLevel;
  @override
  final DateTime firstTimeUsing;

  @override
  String toString() {
    return 'UserInfo(id: $id, email: $email, userName: $userName, userImagePath: $userImagePath, workTime: $workTime, breakTime: $breakTime, accountLevel: $accountLevel, firstTimeUsing: $firstTimeUsing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImagePath, userImagePath) ||
                other.userImagePath == userImagePath) &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.breakTime, breakTime) ||
                other.breakTime == breakTime) &&
            (identical(other.accountLevel, accountLevel) ||
                other.accountLevel == accountLevel) &&
            (identical(other.firstTimeUsing, firstTimeUsing) ||
                other.firstTimeUsing == firstTimeUsing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, userName,
      userImagePath, workTime, breakTime, accountLevel, firstTimeUsing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {final int id,
      final String email,
      final String userName,
      final String userImagePath,
      final int workTime,
      final int breakTime,
      final AccountLevel accountLevel,
      required final DateTime firstTimeUsing}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get userName;
  @override
  String get userImagePath;
  @override
  int get workTime;
  @override
  int get breakTime;
  @override
  AccountLevel get accountLevel;
  @override
  DateTime get firstTimeUsing;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
