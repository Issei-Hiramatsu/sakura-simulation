import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/use_case/timer_log_use_case.dart';

import '/infrastructure/timer_log_repository.dart';

//いるときといらない時の区別をつける
final fetchAllTimerWorkedType = StreamProvider(
  (ref) {
    return TimerLogUseCase(timerLogRepository: TimerLogRepository())
        .fetchAllTimerWorkedType();
  },
);

final workedTypeListProvider =
    NotifierProvider<WorkedTypeListNotifier, List<String>>(
  () => WorkedTypeListNotifier(),
);

class WorkedTypeListNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    state = [];
    ref.watch(fetchAllTimerWorkedType).whenData((dataList) {
      state = dataList;
    });
    return state;
  }

  void addWorkedType(String workedType) {
    state = [...state, workedType];
  }
}
