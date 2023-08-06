import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSdR0_c_62EjXBSnOYN-0HIXf3LVpAU_DLs4OtpMkWSx-0n2jA/viewform');
Future<void> launchBugReportUrl(BuildContext context) async {
  if (await launchUrl(url)) {
    SnackBar(
      content: const Text('このURLは開けませんでした'),
      action: SnackBarAction(
        label: '戻る',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ありがとうございます！'),
      ),
    );
  }
}
