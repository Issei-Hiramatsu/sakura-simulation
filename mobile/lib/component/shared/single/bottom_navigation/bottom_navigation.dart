import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../token/color/color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.sp,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: lowEmphasis.withOpacity(0.5),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28.sp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, size: 28.sp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, size: 28.sp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, size: 28.sp),
            label: '',
          ),
        ],
      ),
    );
  }
}
