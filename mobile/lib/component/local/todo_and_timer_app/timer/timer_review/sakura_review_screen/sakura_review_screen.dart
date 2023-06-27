import 'package:flutter/material.dart';

import '../../../../../../importer.dart';
import '../../../../../shared/single/icon_image/icon_image.dart';

class SakuraReviewScreen extends StatelessWidget {
  const SakuraReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('お疲れ様です！', style: title2Regular(black)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
          child: Text(
            'タスクを精算し次のタスクを準備してから\n休憩に行くとスムーズに始められますよ',
            style: caption1Regular(black),
            textAlign: TextAlign.center,
          ),
        ),
        SpaceBox(height: 8.sp),
        const IconImage(assets: 'assets/images/sakura_icon.jpg'),
      ],
    );
  }
}
