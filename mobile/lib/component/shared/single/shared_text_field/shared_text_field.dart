import 'package:flutter/material.dart';

class SharedTextField extends StatelessWidget {
  const SharedTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.keyboardType,
    this.obscureText = false,
  });
  final void Function(String)? onChanged;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
