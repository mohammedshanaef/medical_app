import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:medical_app/Features/splash/presentation/views/widgets/animation_manager.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late final AnimationsManager animationsManager;

  @override
  void initState() {
    super.initState();
    animationsManager = AnimationsManager();
    animationsManager.initialize(this, const Duration(seconds: 5));
    navigateToOnBoarding();
  }

  @override
  void dispose() {
    animationsManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildLogo(),
      ),
    );
  }

  void navigateToOnBoarding() {
    context.navigateTo(
      const OnBoardingView(),
      delay: const Duration(seconds: 6),
      transition: Transition.zoom,
      duration: const Duration(seconds: 3),
    );
  }

  Widget buildLogo() {
    return FadeTransition(
      opacity: animationsManager.fadeAnimation,
      child: SlideTransition(
        position: animationsManager.translationAnimation,
        child: ScaleTransition(
          scale: animationsManager.scaleAnimation,
          child: RotationTransition(
            turns: animationsManager.rotationAnimation,
            child: SvgPicture.asset(
              AssetData.logo,
              width: 193,
            ),
          ),
        ),
      ),
    );
  }
}
