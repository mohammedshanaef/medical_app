import 'package:flutter/material.dart';
import 'package:medical_app/constant.dart';

class PromotingText extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onPressed;

  const PromotingText({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
