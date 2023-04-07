import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../token/color/color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: borderHighEmphasis, width: 1.0)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: lowEmphasis.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 21.sp), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 21.sp), label: ''),
        ],
      ),
    );
  }
}
