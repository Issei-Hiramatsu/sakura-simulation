import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/use_case/timer_log_use_case.dart';

import '/infrastructure/timer_log_repository.dart';

final fetchAllTimerWorkedSeconds = StreamProvider(
  (ref) {
    return TimerLogUseCase(timerLogRepository: TimerLogRepository())
        .fetchAllWorkedSeconds();
  },
);

final workedSecondsListProvider =
    NotifierProvider<WorkedSecondsListNotifier, List<int>>(
  () => WorkedSecondsListNotifier(),
);
final workedSecondsProvider = Provider(
    (ref) => TimerLogUseCase(timerLogRepository: TimerLogRepository()));

class WorkedSecondsListNotifier extends Notifier<List<int>> {
  @override
  List<int> build() {
    state = [];
    ref.watch(fetchAllTimerWorkedSeconds).whenData((dataList) {
      state = dataList;
    });
    return state;
  }

  void addWorkedSeconds(int workedSeconds) {
    state = [...state, workedSeconds];
    ref
        .read(workedSecondsProvider)
        .addWorkedSeconds(workedSeconds: workedSeconds);
  }
}
