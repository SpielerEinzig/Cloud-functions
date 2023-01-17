import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
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
