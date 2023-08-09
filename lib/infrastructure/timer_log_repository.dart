import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/timer_log/timer_log.dart';
import 'user_repository.dart';

class TimerLogRepository extends ITimerLogRepository {
  @override
  Stream<Map<String, List<TimerLog>>> fetchAllTimerLog() async* {
    final collection = await getUserCollection().then(
      (userCollection) => userCollection.collection('timerLog').snapshots(),
    );

    yield* collection.asyncMap((querySnapshot) async {
      Map<String, List<TimerLog>> timerLogs = {};
      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedTime = json['workedTime'];

        //参照型であるworkedTypeを取得する
        final DocumentReference workedTypeRef = json['workedType'];
        final DocumentSnapshot workedTypeSnapshot =
            await FirebaseFirestore.instance.doc(workedTypeRef.path).get();
        //与えられたデータを変換する
        final workedTypeJson =
            workedTypeSnapshot.data() as Map<String, dynamic>;
        final workedType = workedTypeJson['workedType'];

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

        timerLogs[workedType.toString()] = workedSecondsList;
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
        //logBとlogAの値が同じな場合は片方が消滅してしまうので、0にならないように返す
        int compare = logB.compareTo(logA);
        return compare == 0 ? 1 : compare;
      });
      return timerLogs;
    });
  }

  @override
  void addTimerLog(TimerLog timerLog) async {
    final timerLogCollection = await getUserCollection().then(
      (userCollection) => userCollection.collection('timerLog'),
    );
    final workedTypeListCollection = await getUserCollection().then(
      (userCollection) => userCollection.collection('workedTypeList'),
    );
    //workedTypeのドキュメントIDを取得して参照型を作成する(参照型には対象のドキュメントIDが必要)
    final String workedTypeDocumentId = await workedTypeListCollection
        .where('workedType', isEqualTo: timerLog.workedType)
        .get()
        .then((value) {
      return value.docs.first.reference.id;
    });

    final workedType = workedTypeListCollection.doc(workedTypeDocumentId);

    final workedTimestamp = Timestamp.fromMillisecondsSinceEpoch(
        timerLog.workedTime.inMilliseconds);
    await timerLogCollection.add(
      {
        'startedAt': timerLog.statedAt,
        'endAt': timerLog.endAt,
        'workedType': workedType,
        'workedTime': workedTimestamp,
      },
    );
  }

  @override
  void addWorkedType(String workedType) async {
    final collection = await getUserCollection().then(
      (userCollection) => userCollection.collection('workedTypeList'),
    );
    QuerySnapshot snapshot =
        await collection.where('workedType', isEqualTo: workedType).get();

    if (snapshot.docs.isEmpty) {
      // 同じworkedTypeが存在しない場合のみデータを登録
      await collection.add({
        'workedType': workedType,
      });
    }
  }

  @override
  Stream<List<String>> fetchAllTimerWorkedType() async* {
    final collection = await getUserCollection().then(
      (userCollection) =>
          userCollection.collection('workedTypeList').snapshots(),
    );
    yield* collection.map((querySnapshot) {
      List<String> workedTypeList = [];
      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedType = json['workedType'];
        workedTypeList.add(workedType);
      }
      workedTypeList = workedTypeList.toSet().toList();
      return workedTypeList;
    });
  }

  @override
  void addWorkedSeconds(int workedSeconds) async {
    final collection = await getUserCollection().then(
      (userCollection) => userCollection.collection('workedSecondsList'),
    );
    QuerySnapshot snapshot =
        await collection.where('workedSeconds', isEqualTo: workedSeconds).get();

    if (snapshot.docs.isEmpty) {
      await collection.add({
        'workedSeconds': workedSeconds,
      });
    }
  }

  @override
  Stream<List<int>> fetchAllWorkedSeconds() async* {
    final collection = await getUserCollection().then(
      (userCollection) =>
          userCollection.collection('workedSecondsList').snapshots(),
    );
    yield* collection.map((querySnapshot) {
      List<int> workedSecondsList = [];
      for (var doc in querySnapshot.docs) {
        final json = doc.data();
        final workedSeconds = json['workedSeconds'];
        workedSecondsList.add(workedSeconds);
      }
      workedSecondsList = workedSecondsList.toSet().toList();
      return workedSecondsList;
    });
  }
}
