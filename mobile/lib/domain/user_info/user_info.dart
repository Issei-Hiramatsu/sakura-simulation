import 'package:freezed_annotation/freezed_annotation.dart';

import 'elements/account_level/account_level.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String userName,
    @Default('') String userImagePath,
    @Default(25) int workTime,
    @Default(5) int breakTime,
    @Default(AccountLevel.guest) AccountLevel accountLevel,
    required DateTime firstTimeUsing, //カレンダー日程を決めるため
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

abstract class IUserInfoRepository {
  void registerUserInfo(UserInfo userInfo);
}
