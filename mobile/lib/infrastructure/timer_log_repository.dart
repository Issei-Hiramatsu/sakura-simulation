import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import '/domain/user/elements/timer_log/timer_log.dart';

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

      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedType = json['workedType'];
        final workedTime = json['workedTime'];
        List<Duration> workedSecondsList = timerLogs[workedType] ?? [];

        Duration workedSeconds = const Duration(seconds: 0);
        if (workedTime is Timestamp) {
          workedSeconds = Duration(seconds: workedTime.seconds);
          workedSecondsList.add(workedSeconds);
        }

        timerLogs[workedType] = workedSecondsList;
      }

      timerLogs = SplayTreeMap.from(timerLogs, (keyA, keyB) {
        final logA = timerLogs[keyA]!.fold(
            0,
            (int previousValue, Duration duration) =>
                previousValue + duration.inMinutes);
        final logB = timerLogs[keyA]!.fold(
            0,
            (int previousValue, Duration duration) =>
                previousValue + duration.inMinutes);
        return logA.compareTo(logB);
      });
      return timerLogs;
    });
  }

  @override
  void addTimerLog(TimerLog timerLog) async {
    final collection = timerLogByUser;
    final workedTimestamp = Timestamp.fromMillisecondsSinceEpoch(
        timerLog.workedTime.inMilliseconds);
    await collection.add(
      {
        'statedAt': timerLog.statedAt,
        'endAt': timerLog.endAt,
        'workedType': timerLog.workedType,
        'workedTime': workedTimestamp,
      },
    );
  }
}
