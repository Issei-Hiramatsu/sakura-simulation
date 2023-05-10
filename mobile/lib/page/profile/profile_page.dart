import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';

import '../../component/local/profile/active_overview/active_overview.dart';

class SlackProfilePage extends StatelessWidget {
  final String name;
  final String photoUrl;

  const SlackProfilePage({
    super.key,
    required this.name,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メニュー'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(photoUrl),
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
          const ActiveOverView()
        ],
      ),
    );
  }
}
