import 'package:flutter/material.dart';

import '../../component/shared/single/bottom_navigation/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Image.asset(
            'assets/images/sakura_road.jpg',
            fit: BoxFit.fill,
          )),
          BottomNavigation(),
        ],
      ),
    );
  }
}
