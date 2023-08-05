import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user_settings/user_settings.dart';

class UserSettingsRepository extends IUserSettingsRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  void registerUserSettings(UserSettings UserSettings) async {
    CollectionReference users = firestore.collection('users');
    await users.add({
      'id': UserSettings.id,
      'email': UserSettings.email,
      'userName': UserSettings.userName,
      'userImagePath': UserSettings.userImagePath,
      'timerDetail': {
        'workTime': UserSettings.workTime,
        'breakTime': UserSettings.breakTime,
      },
      'accountLevel': '${UserSettings.accountLevel}',
      'firstTimeUsing': UserSettings.firstTimeUsing,
    });
  }
}
