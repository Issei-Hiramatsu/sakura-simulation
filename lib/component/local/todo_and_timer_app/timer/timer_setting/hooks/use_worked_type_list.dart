import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/use_case/timer_log_use_case.dart';

import '/infrastructure/timer_log_repository.dart';

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
final workedTypeProvider = Provider(
    (ref) => TimerLogUseCase(timerLogRepository: TimerLogRepository()));

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
    ref.read(workedTypeProvider).addWorkedType(workedType: workedType);
  }
}
