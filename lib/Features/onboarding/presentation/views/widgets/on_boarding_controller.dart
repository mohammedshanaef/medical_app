import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/onboarding/presentation/views/widgets/on_boarding_dots.dart';
import 'package:medical_app/Features/onboarding/presentation/views/widgets/on_boarding_item.dart';
import 'package:medical_app/Features/welcome/presentation/views/welcome_view.dart';
import 'package:medical_app/constant.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';

class OnBoardingController extends StatefulWidget {
  const OnBoardingController({super.key});

  @override
  State<OnBoardingController> createState() => _OnBoardingControllerState();
}

class _OnBoardingControllerState extends State<OnBoardingController> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OnBoardingHeader(),
          const SizedBox(height: 32),
          Expanded(
            child: OnBoardingPageView(
              pageController: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
            ),
          ),
          OnBoardingDots(currentIndex: _currentIndex, totalDots: 2),
          const SizedBox(height: 32),
          OnBoardingFooter(
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const WelcomeView());
            },
            child: const Text(
              'Skip',
              style: Styles.text16,
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnBoardingPageView({
    required this.pageController,
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        OnBoardingItem(
          imagePath: AssetData.boarding1,
          title: 'Online health check',
          subtitle: 'Book the best doctor in various \nspecialties',
        ),
        OnBoardingItem(
          imagePath: AssetData.boarding2,
          title: 'Near To You',
          subtitle: '  Schedule Your Visit At Any Time \n That Suits You',
        ),
      ],
    );
  }
}

class OnBoardingFooter extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;

  const OnBoardingFooter({
    required this.currentIndex,
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 23,
        right: 24,
        bottom: 40,
      ),
      child: CustomButton(
        text: currentIndex < 1 ? 'Next' : 'Get Started',
        onPressed: () {
          if (currentIndex < 1) {
            pageController.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          } else {
            Get.off(
              const WelcomeView(),
              duration: const Duration(seconds: 1),
              transition: Transition.zoom,
            );
          }
        },
        isNextButton: currentIndex < 1,
        color: kPrimaryColor,
      ),
    );
  }
}
