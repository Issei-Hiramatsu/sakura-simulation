import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakura_simulation/component/shared/single/shared_app_bar/shared_app_bar.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

import '../../component/local/home_page/body/simulation_screen/simulation_screen.dart';
import '../../component/shared/token/text_style/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: '', textStyle: titleMedium(white)),
      ),
      body: Column(
        children: const [
          Expanded(child: SimulationScreen()),
        ],
      ),
    );
  }
}
