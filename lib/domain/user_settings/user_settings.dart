import 'package:freezed_annotation/freezed_annotation.dart';

import '../account_level/account_level.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default('') String id,
    @Default('') String email,
    @Default('') String userName,
    @Default('') String userImagePath,
    @Default(AccountLevel.guest) AccountLevel accountLevel,
    required DateTime firstTimeUsing, //カレンダー日程を決めるため
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

abstract class IUserSettingsRepository {
  Stream<UserSettings> fetchUserSettings();
  void createUserSettings(UserSettings userSettings);
}
