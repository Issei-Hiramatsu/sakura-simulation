import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/user_settings/user_settings.dart';

//UIDに合致するのユーザのドキュメントIDを取得する
Future<String> getUserDocId() async {
  final userUid = FirebaseAuth.instance.currentUser?.uid;
  if (userUid != null) {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userUid)
        .get()
        .then((QuerySnapshot snapshot) {
      return snapshot.docs.first.reference.id;
    });
  } else {
    //ここをテストモードにしてもいいかも
    throw Exception('ユーザがログインしていません。');
  }
}

class UserSettingsRepository extends IUserSettingsRepository {
  @override
  Stream<UserSettings> fetchUserSettings() async* {
    final String userDocID = await getUserDocId();
    yield* FirebaseFirestore.instance
        .collection('users')
        .doc(userDocID)
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
    await FirebaseFirestore.instance.collection('users').add({
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
