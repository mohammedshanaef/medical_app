import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension NavigationExtension on BuildContext {
  void navigateTo(
    Widget destination, {
    Duration delay = const Duration(seconds: 0),
    Transition transition = Transition.fade,
    Duration? duration,
  }) {
    Future.delayed(delay, () {
      Get.to(
        () => destination,
        transition: transition,
        duration: duration,
      );
    });
  }
}

extension NavigationExtensionOff on BuildContext {
  void navigateOffTo(
    Widget destination, {
    Duration delay = const Duration(seconds: 0),
    Transition transition = Transition.fade,
    Duration? duration,
  }) {
    Future.delayed(delay, () {
      Get.off(
        () => destination,
        transition: transition,
        duration: duration,
      );
    });
  }
}

extension NavigationExtensionOffAll on BuildContext {
  void navigateOffAll(
    Widget destination, {
    Duration delay = const Duration(seconds: 0),
    Transition transition = Transition.fade,
    Duration? duration,
  }) {
    Future.delayed(delay, () {
      Get.offAll(
        () => destination,
        transition: transition,
        duration: duration,
      );
    });
  }
}

extension NavigationExtensions on BuildContext {
  /// Replaces the current page with a new one.
  void pushReplacementTo(Widget newPage) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }
}
