import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/navigator/navigator.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/token/color/color.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.text, required this.timerPage});

  final String text;
  final Widget timerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundLightBlack,
      child: ListTile(
        onTap: () {
          NavigatorPush(context, page: timerPage);
        },
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
        title: Text(
          text,
          style: bodyRegular(white),
        ),
      ),
    );
  }
}
