import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/token/color/color.dart';
import '../todo_radio_button/todo_radio_button.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.sp,
      decoration: BoxDecoration(
        color: backgroundLightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          leading: TodoRadioButton(isSelected: false),
          //TODO: お気に入りボタン

          trailing: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(
              Icons.star_outline,
              color: gray,
              size: 18.sp,
            ),
          ),
          title: Text(
            text,
            style: isSelected ? labelLarge(white) : labelLargeLineThrough(gray),
          ),
        ),
      ),
    );
  }
}
