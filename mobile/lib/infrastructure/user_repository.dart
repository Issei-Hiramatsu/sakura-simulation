import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user_settings/user_settings.dart';

class UserSettingsRepository extends IUserSettingsRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Stream<UserSettings> fetchUserSettings() {
    return users
        .doc('7IxRZtkdvvUMxizsycJx')
        .snapshots()
        .map((DocumentSnapshot snapshot) {
      final json = snapshot.data() as Map<String, dynamic>;

      final createdTimestamp = json['firstTimeUsing'];
      DateTime firstTimeUsing = DateTime.now();
      if (createdTimestamp is Timestamp) {
        firstTimeUsing = createdTimestamp.toDate();
      }

      return UserSettings(
        id: json['id'],
        email: json['email'],
        userName: json['userName'],
        userImagePath: json['userImagePath'],
        workTime: json['timerDetail']['workTime'],
        breakTime: json['timerDetail']['breakTime'],
        //accountLevel: json['accountLevel'],
        firstTimeUsing: firstTimeUsing,
      );
    });
  }

  @override
  void createUserSettings(UserSettings userSettings) async {
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
