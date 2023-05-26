import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakura_simulation/component/shared/token/navigator/navigator.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/token/color/color.dart';
import 'elements/pomodoro_timer/elements/timer_progress_indicator/elements/work_and_break_pie_chart/work_and_break_pie_chart.dart';
import 'elements/pomodoro_timer/hooks/temp_user_settings.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.text, required this.timerPage});

  final String text;
  final Widget timerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundLightBlack,
      child: Center(
        child: ListTile(
          onTap: () {
            NavigatorPush(context, page: timerPage);
          },
          contentPadding: const EdgeInsets.all(10),
          leading: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              WorkAndBreakPieChart(
                  workMinutes: 1,
                  breakMinutes: 0,
                  chartWidth: 4.sp,
                  size: 66.sp),
              Text(
                '0$workTime:00',
                style: title3Bold(white),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: gray,
              )),
          title: Text(
            text,
            style: bodyRegular(white),
          ),
        ),
      ),
    );
  }
}
