import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.buttonStyle,
    this.textStyle,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              side: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                fontSize: 25,
              ),
        ),
      ),
    );
  }
}
