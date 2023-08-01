import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user/elements/timer/timer.dart';

class TimerLogRepository extends ITimerLogRepository {
  final timerLogByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('timerLog');

  @override
  Stream<Map<String, List<Duration>>> fetchAllTimerLog() {
    final collection = timerLogByUser.snapshots();
    return collection.map((querySnapshot) {
      Map<String, List<Duration>> timerLogs = {};
      List<Duration> workedSecondsList = [];

      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedType = json['workedType'];

        final workedTime = json['workedTime'];
        Duration workedSeconds = const Duration(seconds: 0);
        if (workedTime is Timestamp) {
          workedSeconds = Duration(seconds: workedTime.seconds);
          workedSecondsList.add(workedSeconds);
        }

        timerLogs[workedType] = workedSecondsList;
      }
      return timerLogs;
    });
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
