import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../component/local/profile/user_profile_card/user_profile_card.dart';
import '../../component/shared/single/shared_app_bar/shared_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    //ここはUser引数に置換する予定

    super.key,
    required this.name,
    required this.photoUrl,
  });
  final String name;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: 'メニュー', textStyle: titleMedium(white)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserProfileCard(name: name, photoUrl: photoUrl)),
    );
  }
}
