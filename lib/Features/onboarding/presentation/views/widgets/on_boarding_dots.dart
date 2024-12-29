import 'package:flutter/material.dart';
import 'package:medical_app/constant.dart';

class OnBoardingDots extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const OnBoardingDots({
    Key? key,
    required this.currentIndex,
    required this.totalDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: currentIndex == index ? 20 : 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? kPrimaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
