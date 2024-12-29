import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/utils/styles.dart';

class OnBoardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          imagePath,
          height: 271,
          width: 375,
        ),
        const SizedBox(height: 76),
        Text(
          title,
          style: Styles.text32,
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Styles.text16,
        ),
      ],
    );
  }
}
