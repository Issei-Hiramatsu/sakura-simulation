// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return _Timer.fromJson(json);
}

/// @nodoc
mixin _$Timer {
  Map<String, Duration> get timerLog => throw _privateConstructorUsedError;
  int get workTime => throw _privateConstructorUsedError;
  int get breakTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res, Timer>;
  @useResult
  $Res call({Map<String, Duration> timerLog, int workTime, int breakTime});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res, $Val extends Timer>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerLog = null,
    Object? workTime = null,
    Object? breakTime = null,
  }) {
    return _then(_value.copyWith(
      timerLog: null == timerLog
          ? _value.timerLog
          : timerLog // ignore: cast_nullable_to_non_nullable
              as Map<String, Duration>,
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$$_TimerCopyWith(_$_Timer value, $Res Function(_$_Timer) then) =
      __$$_TimerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Duration> timerLog, int workTime, int breakTime});
}

/// @nodoc
class __$$_TimerCopyWithImpl<$Res> extends _$TimerCopyWithImpl<$Res, _$_Timer>
    implements _$$_TimerCopyWith<$Res> {
  __$$_TimerCopyWithImpl(_$_Timer _value, $Res Function(_$_Timer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerLog = null,
    Object? workTime = null,
    Object? breakTime = null,
  }) {
    return _then(_$_Timer(
      timerLog: null == timerLog
          ? _value._timerLog
          : timerLog // ignore: cast_nullable_to_non_nullable
              as Map<String, Duration>,
      workTime: null == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timer implements _Timer {
  const _$_Timer(
      {final Map<String, Duration> timerLog = const {},
      this.workTime = 25,
      this.breakTime = 5})
      : _timerLog = timerLog;

  factory _$_Timer.fromJson(Map<String, dynamic> json) =>
      _$$_TimerFromJson(json);

  final Map<String, Duration> _timerLog;
  @override
  @JsonKey()
  Map<String, Duration> get timerLog {
    if (_timerLog is EqualUnmodifiableMapView) return _timerLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_timerLog);
  }

  @override
  @JsonKey()
  final int workTime;
  @override
  @JsonKey()
  final int breakTime;

  @override
  String toString() {
    return 'Timer(timerLog: $timerLog, workTime: $workTime, breakTime: $breakTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timer &&
            const DeepCollectionEquality().equals(other._timerLog, _timerLog) &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.breakTime, breakTime) ||
                other.breakTime == breakTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_timerLog), workTime, breakTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerCopyWith<_$_Timer> get copyWith =>
      __$$_TimerCopyWithImpl<_$_Timer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerToJson(
      this,
    );
  }
}

abstract class _Timer implements Timer {
  const factory _Timer(
      {final Map<String, Duration> timerLog,
      final int workTime,
      final int breakTime}) = _$_Timer;

  factory _Timer.fromJson(Map<String, dynamic> json) = _$_Timer.fromJson;

  @override
  Map<String, Duration> get timerLog;
  @override
  int get workTime;
  @override
  int get breakTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimerCopyWith<_$_Timer> get copyWith =>
      throw _privateConstructorUsedError;
}
