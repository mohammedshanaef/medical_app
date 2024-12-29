import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/styles.dart';
import 'package:medical_app/constant.dart'; // Ensure this import is there to access kPrimaryColor

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isNextButton;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isNextButton = false,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        fixedSize: const Size(328, 48),
      ),
      child: Text(
        text,
        style: Styles.text16.copyWith(color: Colors.white),
      ),
    );
  }
}
