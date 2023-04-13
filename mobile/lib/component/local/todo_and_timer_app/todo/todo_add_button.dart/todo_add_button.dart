import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

class TodoAddButton extends StatelessWidget {
  const TodoAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.sp,
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
      child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), //角の丸み
          ),
          backgroundColor: backgroundLightBlack,
          child: Row(
            children: [
              SizedBox(width: 12.sp),
              const Icon(Icons.add),
              SizedBox(width: 12.sp),
              Text('タスクの追加', style: bodyRegular(white)),
            ],
          ),
          onPressed: () {}),
    );
  }
}
