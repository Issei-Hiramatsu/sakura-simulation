import 'package:flutter/material.dart';

import '../../../shared/token/color/color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tab});
  final List<Widget> tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundLightBlack,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundGray,
        ),
        child: TabBar(
          labelColor: white,
          unselectedLabelColor: midEmphasis,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: gray,
          ),
          tabs: tab,
        ),
      ),
    );
  }
}
