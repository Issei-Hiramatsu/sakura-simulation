import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user/elements/timer/timer.dart';

class TimerLogRepository extends ITimerLogRepository {
  final timerLogByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('timerDetail')
      .doc('timerLog');

  @override
  Stream<Map<DateTime, Map<String, List<Duration>>>> fetchAllTimerLog() {
    // TODO: implement fetchAllTimerLog
    throw UnimplementedError();
  }

  @override
  void updateTimerLog(
      DateTime date, String workedType, Duration workedTime) async {
    final collection = timerLogByUser
        .collection('${date.year}')
        .doc('${DateTime(date.year, date.month, date.day)}')
        .collection(workedType);
    await collection.add({'workedTime': '$workedTime'}); //int型で渡せるように変更する
  }
}
