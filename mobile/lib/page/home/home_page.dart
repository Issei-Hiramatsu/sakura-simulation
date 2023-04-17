import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/local/home_page/body/simulation_screen/simulation_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(42.sp),
        child: AppBar(),
      ),
      body: Column(
        children: const [
          Expanded(child: SimulationScreen()),
        ],
      ),
    );
  }
}
