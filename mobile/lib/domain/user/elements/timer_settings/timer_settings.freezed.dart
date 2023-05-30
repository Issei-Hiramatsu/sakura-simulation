// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerSettings _$TimerSettingsFromJson(Map<String, dynamic> json) {
  return _TimerSettings.fromJson(json);
}

/// @nodoc
mixin _$TimerSettings {
  int get workTime => throw _privateConstructorUsedError;
  int get breakTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerSettingsCopyWith<TimerSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsCopyWith<$Res> {
  factory $TimerSettingsCopyWith(
          TimerSettings value, $Res Function(TimerSettings) then) =
      _$TimerSettingsCopyWithImpl<$Res, TimerSettings>;
  @useResult
  $Res call({int workTime, int breakTime});
}

/// @nodoc
class _$TimerSettingsCopyWithImpl<$Res, $Val extends TimerSettings>
    implements $TimerSettingsCopyWith<$Res> {
  _$TimerSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTime = null,
    Object? breakTime = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_TimerSettingsCopyWith<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  factory _$$_TimerSettingsCopyWith(
          _$_TimerSettings value, $Res Function(_$_TimerSettings) then) =
      __$$_TimerSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int workTime, int breakTime});
}

/// @nodoc
class __$$_TimerSettingsCopyWithImpl<$Res>
    extends _$TimerSettingsCopyWithImpl<$Res, _$_TimerSettings>
    implements _$$_TimerSettingsCopyWith<$Res> {
  __$$_TimerSettingsCopyWithImpl(
      _$_TimerSettings _value, $Res Function(_$_TimerSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workTime = null,
    Object? breakTime = null,
  }) {
    return _then(_$_TimerSettings(
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
class _$_TimerSettings implements _TimerSettings {
  const _$_TimerSettings({this.workTime = 25, this.breakTime = 5});

  factory _$_TimerSettings.fromJson(Map<String, dynamic> json) =>
      _$$_TimerSettingsFromJson(json);

  @override
  @JsonKey()
  final int workTime;
  @override
  @JsonKey()
  final int breakTime;

  @override
  String toString() {
    return 'TimerSettings(workTime: $workTime, breakTime: $breakTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerSettings &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.breakTime, breakTime) ||
                other.breakTime == breakTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, workTime, breakTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerSettingsCopyWith<_$_TimerSettings> get copyWith =>
      __$$_TimerSettingsCopyWithImpl<_$_TimerSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerSettingsToJson(
      this,
    );
  }
}

abstract class _TimerSettings implements TimerSettings {
  const factory _TimerSettings({final int workTime, final int breakTime}) =
      _$_TimerSettings;

  factory _TimerSettings.fromJson(Map<String, dynamic> json) =
      _$_TimerSettings.fromJson;

  @override
  int get workTime;
  @override
  int get breakTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimerSettingsCopyWith<_$_TimerSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
