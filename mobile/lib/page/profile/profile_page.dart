import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../component/shared/single/shared_app_bar/shared_app_bar.dart';
import '../../component/local/profile/active_overview/active_overview.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String photoUrl;

  const ProfilePage({
    super.key,
    required this.name,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: 'メニュー', textStyle: titleMedium(white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 80.sp,
              height: 80.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(photoUrl),
                ),
              ),
            ),
            const SpaceBox(width: 16.0),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
