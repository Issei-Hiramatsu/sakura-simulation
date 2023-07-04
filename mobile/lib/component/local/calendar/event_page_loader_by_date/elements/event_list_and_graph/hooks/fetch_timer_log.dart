//ここでデータベースを選定する
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/use_case/timer_log_use_case.dart';

import '/infrastructure/test_data/test_timer_log_repository.dart';

final fetchAllTimerLog = StreamProvider.family(
  (ref, arg) {
    return TimerLogUseCase(timerLogRepository: TestTimerLogRepository())
        .fetchAllTimerLog();
  },
);
