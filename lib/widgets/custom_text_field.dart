import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
        ),
        enabledBorder: textFieldBorder(),
        border: textFieldBorder(),
        focusedBorder: textFieldBorder(),
        errorBorder: textFieldBorder(),
      ),
    );
  }
}

OutlineInputBorder textFieldBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2,
      style: BorderStyle.solid,
    ),
  );
}
