import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user_settings/user_settings.dart';

class UserSettingsRepository extends IUserSettingsRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  void createUserSettings(UserSettings userSettings) async {
    CollectionReference users = firestore.collection('users');
    await users.add({
      'id': userSettings.id,
      'email': userSettings.email,
      'userName': userSettings.userName,
      'userImagePath': userSettings.userImagePath,
      'timerDetail': {
        'workTime': userSettings.workTime,
        'breakTime': userSettings.breakTime,
      },
      'accountLevel': '${userSettings.accountLevel}',
      'firstTimeUsing': userSettings.firstTimeUsing,
    });
  }
}
