import 'package:flutter/material.dart';

import '../../../../importer.dart';
import '../../../shared/single/circular_assets_images/circular_images.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    super.key,
    //ここはUser引数に置換する予定
    required this.name,
    required this.photoUrl,
  });

  final String name;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularAssetsImages(size: 80.sp, assetsImage: photoUrl),
        const SpaceBox(width: 16.0),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ],
    );
  }
}
