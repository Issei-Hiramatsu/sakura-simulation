//ここでデータベースを選定する
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/use_case/timer_log_use_case.dart';

import '/infrastructure/timer_log_repository.dart';

final fetchAllTimerWorkedType = StreamProvider.family(
  (ref, arg) {
    return TimerLogUseCase(timerLogRepository: TimerLogRepository())
        .fetchAllTimerWorkedType();
  },
);
