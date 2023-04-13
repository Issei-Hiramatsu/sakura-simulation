import 'package:flutter/material.dart';

import '../../component/local/home_page/body/simulation_screen/simulation_screen.dart';
import '../../component/shared/single/bottom_navigation/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Expanded(child: SimulationScreen()),
        ],
      ),
    );
  }
}
