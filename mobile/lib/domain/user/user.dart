import 'package:freezed_annotation/freezed_annotation.dart';

import 'elements/account_level/account_level.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String userName,
    @Default('') String userImagePath,
    @Default(25) int workTime,
    @Default(5) int breakTime,
    @Default(AccountLevel.guest) AccountLevel accountLevel,
    required DateTime firstTimeUsing, //カレンダー日程を決めるため
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

abstract class IUserRepository {
  void registerUser(User user);
}
