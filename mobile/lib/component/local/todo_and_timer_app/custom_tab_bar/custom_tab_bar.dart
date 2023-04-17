import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/token/color/color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tab});
  final List<Widget> tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundBlack,
      padding: EdgeInsets.symmetric(horizontal: 32.sp, vertical: 20.sp),
      child: Container(
        padding: EdgeInsets.all(2.sp),
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
