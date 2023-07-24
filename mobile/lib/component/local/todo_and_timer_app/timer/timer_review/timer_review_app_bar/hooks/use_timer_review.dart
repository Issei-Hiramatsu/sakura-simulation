import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/infrastructure/timer_log_repository.dart';
import '/use_case/timer_log_use_case.dart';

final updateTimerLogProvider = Provider(
    (ref) => TimerLogUseCase(timerLogRepository: TimerLogRepository()));
