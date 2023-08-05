import '../domain/user_settings/user_settings.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class UserSettingsUseCase {
  UserSettingsUseCase({required this.userRepository});
  final IUserSettingsRepository userRepository;

  void registerUserSettings({required UserSettings userSettings}) {
    return userRepository.registerUserSettings(userSettings);
  }
}
