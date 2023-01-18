import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final bool loading;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.loading,
    this.buttonStyle,
    this.textStyle,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: widget.buttonStyle ??
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
        child: widget.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                widget.label,
                style: widget.textStyle ??
                    const TextStyle(
                      fontSize: 25,
                    ),
              ),
      ),
    );
  }
}
