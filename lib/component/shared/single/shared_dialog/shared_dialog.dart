import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

class SharedDialog extends StatelessWidget {
  const SharedDialog({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text(
            "閉じる",
            style: TextStyle(color: primary),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
