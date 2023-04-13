import 'package:flutter/material.dart';

import '../../../shared/token/color/color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tab});
  final List<Widget> tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundBlack,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: backgroundLightBlack,
        ),
        child: TabBar(
          labelColor: white,
          unselectedLabelColor: white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundGray,
          ),
          tabs: tab,
        ),
      ),
    );
  }
}
