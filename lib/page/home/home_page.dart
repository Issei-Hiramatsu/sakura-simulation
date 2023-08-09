import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../component/shared/single/shared_app_bar/shared_app_bar.dart';
import '../../component/local/home_page/body/simulation_screen/simulation_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: 'ホーム', textStyle: titleMedium(white)),
      ),
      body: Column(
        children: const [
          Expanded(child: SimulationScreen()),
        ],
      ),
    );
  }
}
