// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerLog _$TimerLogFromJson(Map<String, dynamic> json) {
  return _TimerLog.fromJson(json);
}

/// @nodoc
mixin _$TimerLog {
  DateTime get statedAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;
  dynamic get workedType => throw _privateConstructorUsedError;
  Duration get workedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerLogCopyWith<TimerLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerLogCopyWith<$Res> {
  factory $TimerLogCopyWith(TimerLog value, $Res Function(TimerLog) then) =
      _$TimerLogCopyWithImpl<$Res, TimerLog>;
  @useResult
  $Res call(
      {DateTime statedAt,
      DateTime? endAt,
      dynamic workedType,
      Duration workedTime});
}

/// @nodoc
class _$TimerLogCopyWithImpl<$Res, $Val extends TimerLog>
    implements $TimerLogCopyWith<$Res> {
  _$TimerLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statedAt = null,
    Object? endAt = freezed,
    Object? workedType = freezed,
    Object? workedTime = null,
  }) {
    return _then(_value.copyWith(
      statedAt: null == statedAt
          ? _value.statedAt
          : statedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workedType: freezed == workedType
          ? _value.workedType
          : workedType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      workedTime: null == workedTime
          ? _value.workedTime
          : workedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerLogCopyWith<$Res> implements $TimerLogCopyWith<$Res> {
  factory _$$_TimerLogCopyWith(
          _$_TimerLog value, $Res Function(_$_TimerLog) then) =
      __$$_TimerLogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime statedAt,
      DateTime? endAt,
      dynamic workedType,
      Duration workedTime});
}

/// @nodoc
class __$$_TimerLogCopyWithImpl<$Res>
    extends _$TimerLogCopyWithImpl<$Res, _$_TimerLog>
    implements _$$_TimerLogCopyWith<$Res> {
  __$$_TimerLogCopyWithImpl(
      _$_TimerLog _value, $Res Function(_$_TimerLog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statedAt = null,
    Object? endAt = freezed,
    Object? workedType = freezed,
    Object? workedTime = null,
  }) {
    return _then(_$_TimerLog(
      statedAt: null == statedAt
          ? _value.statedAt
          : statedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workedType: freezed == workedType ? _value.workedType! : workedType,
      workedTime: null == workedTime
          ? _value.workedTime
          : workedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerLog implements _TimerLog {
  const _$_TimerLog(
      {required this.statedAt,
      this.endAt,
      this.workedType = '未設定',
      this.workedTime = const Duration(seconds: 0)});

  factory _$_TimerLog.fromJson(Map<String, dynamic> json) =>
      _$$_TimerLogFromJson(json);

  @override
  final DateTime statedAt;
  @override
  final DateTime? endAt;
  @override
  @JsonKey()
  final dynamic workedType;
  @override
  @JsonKey()
  final Duration workedTime;

  @override
  String toString() {
    return 'TimerLog(statedAt: $statedAt, endAt: $endAt, workedType: $workedType, workedTime: $workedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerLog &&
            (identical(other.statedAt, statedAt) ||
                other.statedAt == statedAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            const DeepCollectionEquality()
                .equals(other.workedType, workedType) &&
            (identical(other.workedTime, workedTime) ||
                other.workedTime == workedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statedAt, endAt,
      const DeepCollectionEquality().hash(workedType), workedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerLogCopyWith<_$_TimerLog> get copyWith =>
      __$$_TimerLogCopyWithImpl<_$_TimerLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerLogToJson(
      this,
    );
  }
}

abstract class _TimerLog implements TimerLog {
  const factory _TimerLog(
      {required final DateTime statedAt,
      final DateTime? endAt,
      final dynamic workedType,
      final Duration workedTime}) = _$_TimerLog;

  factory _TimerLog.fromJson(Map<String, dynamic> json) = _$_TimerLog.fromJson;

  @override
  DateTime get statedAt;
  @override
  DateTime? get endAt;
  @override
  dynamic get workedType;
  @override
  Duration get workedTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimerLogCopyWith<_$_TimerLog> get copyWith =>
      throw _privateConstructorUsedError;
}
