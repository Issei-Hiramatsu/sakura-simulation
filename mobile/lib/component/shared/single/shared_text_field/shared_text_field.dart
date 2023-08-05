import 'package:flutter/material.dart';

class SharedTextField extends StatelessWidget {
  const SharedTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
  });
  final void Function(String)? onChanged;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
