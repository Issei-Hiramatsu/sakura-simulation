import '../domain/user_settings/user_settings.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class UserSettingsUseCase {
  UserSettingsUseCase({required this.userSettingsRepository});
  final IUserSettingsRepository userSettingsRepository;

  Stream<UserSettings> fetchUserSettings() {
    return userSettingsRepository.fetchUserSettings();
  }

  void createUserSettings({required UserSettings userSettings}) {
    return userSettingsRepository.createUserSettings(userSettings);
  }
}
