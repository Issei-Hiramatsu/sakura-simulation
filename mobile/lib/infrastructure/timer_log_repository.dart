import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import '/domain/user/elements/timer_log/timer_log.dart';

class TimerLogRepository extends ITimerLogRepository {
  final timerLogByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('timerLog');

  @override
  Stream<Map<String, List<TimerLog>>> fetchAllTimerLog() {
    final collection = timerLogByUser.snapshots();
    return collection.map((querySnapshot) {
      Map<String, List<TimerLog>> timerLogs = {};

      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedType = json['workedType'];
        final workedTime = json['workedTime'];
        List<TimerLog> workedSecondsList = timerLogs[workedType] ?? [];

        final startedAtTimestamp = json['startedAt'];
        DateTime startedAt = DateTime(0);
        if (startedAtTimestamp is Timestamp) {
          startedAt = startedAtTimestamp.toDate();
        }
        final endAtTimestamp = json['endAt'];
        DateTime endAt = DateTime(0);
        if (endAtTimestamp is Timestamp) {
          endAt = endAtTimestamp.toDate();
        }

        Duration workedSeconds = const Duration(seconds: 0);
        if (workedTime is Timestamp) {
          workedSeconds = Duration(seconds: workedTime.seconds);
          workedSecondsList.add(TimerLog(
            statedAt: startedAt,
            endAt: endAt,
            workedTime: workedSeconds,
            workedType: workedType,
          ));
        }

        timerLogs[workedType] = workedSecondsList;
      }

      timerLogs = SplayTreeMap.from(timerLogs, (keyA, keyB) {
        final logA = timerLogs[keyA]!.fold(
          0,
          (int previousValue, TimerLog timerLog) =>
              previousValue + timerLog.workedTime.inSeconds,
        );

        final logB = timerLogs[keyB]!.fold(
          0,
          (int previousValue, TimerLog timerLog) =>
              previousValue + timerLog.workedTime.inSeconds,
        );

        return logA == logB ? logA.compareTo(logB) : keyA.compareTo(keyB);
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
        'startedAt': timerLog.statedAt,
        'endAt': timerLog.endAt,
        'workedType': timerLog.workedType,
        'workedTime': workedTimestamp,
      },
    );
  }
}
