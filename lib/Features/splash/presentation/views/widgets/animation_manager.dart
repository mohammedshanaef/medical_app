import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class AnimationsManager {
  late AnimationController animationController;
  late Animation<double> rotationAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> translationAnimation;

  void initialize(TickerProvider vsync, Duration duration) {
    animationController = AnimationController(
      vsync: vsync,
      duration: duration,
    );

    initRotationAnimation();
    initScaleAnimation();
    initFadeAnimation();
    initTranslationAnimation();


    animationController.forward();
    // I Applyed SRP (Principle)
  }

  void dispose() {
    animationController.dispose();
  }

  void initRotationAnimation() {
    rotationAnimation = Tween<double>(begin: 0.0, end: 3.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInToLinear),
    );
  }

  void initScaleAnimation() {
    scaleAnimation = Tween<double>(begin: 0.7, end: 1.3).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );
  }

  void initFadeAnimation() {
    fadeAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );
  }

  void initTranslationAnimation() {
    translationAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );
  }
}
