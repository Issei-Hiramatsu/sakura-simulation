import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../component/local/todo_and_timer_app/timer/worked_seconds_list_view/worked_seconds_list_view.dart';
import '../../../../component/shared/single/button/floating_circle_button/floating_circle_button.dart';

class TimerAppPage extends ConsumerWidget {
  const TimerAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(child: WorkedSecondsListView()),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FloatingCircleButton(
            icon: const Icon(Icons.add),
            onPressed: () => print('object'),
          ),
        ),
      ],
    );
  }
}
