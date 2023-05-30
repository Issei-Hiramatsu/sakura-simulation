import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'account_level.freezed.dart';
part 'account_level.g.dart';

@freezed
class AccountLevel with _$AccountLevel {
  const factory AccountLevel({
    @Default([]) List<User> administrator,
    @Default([]) List<User> premiumUser,
    @Default([]) List<User> generalUser,
    @Default([]) List<User> guest,
  }) = _AccountLevel;

  factory AccountLevel.fromJson(Map<String, dynamic> json) =>
      _$AccountLevelFromJson(json);
}
