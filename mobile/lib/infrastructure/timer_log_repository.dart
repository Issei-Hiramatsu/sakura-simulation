import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user/elements/timer/timer.dart';

class TimerLogRepository extends ITimerLogRepository {
  final timerLogByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('timerLog');

  @override
  Stream<Map<String, List<dynamic>>> fetchAllTimerLog() {
    // final collection = timerLogByUser.snapshots();

    // return collection.map((querySnapshot) {
    //   Map<String, List<dynamic>> timerLogs = {};

    //   for (var doc in querySnapshot.docs) {
    //     String workedType = doc.id;
    //     print(doc.id);
    //     List<dynamic> logData = doc.get('集中時間');
    //     print(logData);

    //     timerLogs[workedType] = logData;
    //   }

    //   return timerLogs;
    // });
  }

  @override
  void addTimerLog(
      DateTime date, String workedType, Duration workedTime) async {
    final collection = timerLogByUser;
    final workedTimestamp =
        Timestamp.fromMillisecondsSinceEpoch(workedTime.inMilliseconds);
    await collection.add(
      {
        'createdAt': Timestamp.now(),
        'workedType': workedType,
        'workedTime': workedTimestamp,
      },
    );
  }
}
