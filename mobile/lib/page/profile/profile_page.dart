import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../domain/user_settings/user_settings.dart';
import '/component/local/profile/user_profile_card/user_profile_card.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.userSettings,
  });

  final UserSettings userSettings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: 'メニュー', textStyle: titleMedium(white)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserProfileCard(
              name: userSettings.userName,
              photoUrl: userSettings.userImagePath)),
    );
  }
}
