// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountLevel _$AccountLevelFromJson(Map<String, dynamic> json) {
  return _AccountLevel.fromJson(json);
}

/// @nodoc
mixin _$AccountLevel {
  List<User> get administrator => throw _privateConstructorUsedError;
  List<User> get premiumUser => throw _privateConstructorUsedError;
  List<User> get generalUser => throw _privateConstructorUsedError;
  List<User> get guest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountLevelCopyWith<AccountLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountLevelCopyWith<$Res> {
  factory $AccountLevelCopyWith(
          AccountLevel value, $Res Function(AccountLevel) then) =
      _$AccountLevelCopyWithImpl<$Res, AccountLevel>;
  @useResult
  $Res call(
      {List<User> administrator,
      List<User> premiumUser,
      List<User> generalUser,
      List<User> guest});
}

/// @nodoc
class _$AccountLevelCopyWithImpl<$Res, $Val extends AccountLevel>
    implements $AccountLevelCopyWith<$Res> {
  _$AccountLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrator = null,
    Object? premiumUser = null,
    Object? generalUser = null,
    Object? guest = null,
  }) {
    return _then(_value.copyWith(
      administrator: null == administrator
          ? _value.administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as List<User>,
      premiumUser: null == premiumUser
          ? _value.premiumUser
          : premiumUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      generalUser: null == generalUser
          ? _value.generalUser
          : generalUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      guest: null == guest
          ? _value.guest
          : guest // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountLevelCopyWith<$Res>
    implements $AccountLevelCopyWith<$Res> {
  factory _$$_AccountLevelCopyWith(
          _$_AccountLevel value, $Res Function(_$_AccountLevel) then) =
      __$$_AccountLevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<User> administrator,
      List<User> premiumUser,
      List<User> generalUser,
      List<User> guest});
}

/// @nodoc
class __$$_AccountLevelCopyWithImpl<$Res>
    extends _$AccountLevelCopyWithImpl<$Res, _$_AccountLevel>
    implements _$$_AccountLevelCopyWith<$Res> {
  __$$_AccountLevelCopyWithImpl(
      _$_AccountLevel _value, $Res Function(_$_AccountLevel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrator = null,
    Object? premiumUser = null,
    Object? generalUser = null,
    Object? guest = null,
  }) {
    return _then(_$_AccountLevel(
      administrator: null == administrator
          ? _value._administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as List<User>,
      premiumUser: null == premiumUser
          ? _value._premiumUser
          : premiumUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      generalUser: null == generalUser
          ? _value._generalUser
          : generalUser // ignore: cast_nullable_to_non_nullable
              as List<User>,
      guest: null == guest
          ? _value._guest
          : guest // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountLevel implements _AccountLevel {
  const _$_AccountLevel(
      {final List<User> administrator = const [],
      final List<User> premiumUser = const [],
      final List<User> generalUser = const [],
      final List<User> guest = const []})
      : _administrator = administrator,
        _premiumUser = premiumUser,
        _generalUser = generalUser,
        _guest = guest;

  factory _$_AccountLevel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountLevelFromJson(json);

  final List<User> _administrator;
  @override
  @JsonKey()
  List<User> get administrator {
    if (_administrator is EqualUnmodifiableListView) return _administrator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_administrator);
  }

  final List<User> _premiumUser;
  @override
  @JsonKey()
  List<User> get premiumUser {
    if (_premiumUser is EqualUnmodifiableListView) return _premiumUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_premiumUser);
  }

  final List<User> _generalUser;
  @override
  @JsonKey()
  List<User> get generalUser {
    if (_generalUser is EqualUnmodifiableListView) return _generalUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_generalUser);
  }

  final List<User> _guest;
  @override
  @JsonKey()
  List<User> get guest {
    if (_guest is EqualUnmodifiableListView) return _guest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guest);
  }

  @override
  String toString() {
    return 'AccountLevel(administrator: $administrator, premiumUser: $premiumUser, generalUser: $generalUser, guest: $guest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountLevel &&
            const DeepCollectionEquality()
                .equals(other._administrator, _administrator) &&
            const DeepCollectionEquality()
                .equals(other._premiumUser, _premiumUser) &&
            const DeepCollectionEquality()
                .equals(other._generalUser, _generalUser) &&
            const DeepCollectionEquality().equals(other._guest, _guest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_administrator),
      const DeepCollectionEquality().hash(_premiumUser),
      const DeepCollectionEquality().hash(_generalUser),
      const DeepCollectionEquality().hash(_guest));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountLevelCopyWith<_$_AccountLevel> get copyWith =>
      __$$_AccountLevelCopyWithImpl<_$_AccountLevel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountLevelToJson(
      this,
    );
  }
}

abstract class _AccountLevel implements AccountLevel {
  const factory _AccountLevel(
      {final List<User> administrator,
      final List<User> premiumUser,
      final List<User> generalUser,
      final List<User> guest}) = _$_AccountLevel;

  factory _AccountLevel.fromJson(Map<String, dynamic> json) =
      _$_AccountLevel.fromJson;

  @override
  List<User> get administrator;
  @override
  List<User> get premiumUser;
  @override
  List<User> get generalUser;
  @override
  List<User> get guest;
  @override
  @JsonKey(ignore: true)
  _$$_AccountLevelCopyWith<_$_AccountLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
