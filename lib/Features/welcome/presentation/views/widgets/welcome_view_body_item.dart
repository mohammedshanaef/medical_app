import 'package:flutter/material.dart';
import 'package:medical_app/Features/auth/presentation/views/login_screen_view.dart';
import 'package:medical_app/Features/auth/presentation/views/sign_up_view.dart';
import 'package:medical_app/constant.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/helper.dart';

class WelocmeViewBodyItems extends StatelessWidget {
  const WelocmeViewBodyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Stack(
        children: [
          WelcomeText(),
          SignUpButton(),
          LogInButton(),
        ],
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.5 - 40,
      left: 0,
      right: 0,
      child: const Text(
        'Welcome!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.5 + 218,
      left: 26,
      right: 26,
      child: CustomButton(
        text: 'Sign Up',
        onPressed: () {
          context.navigateTo(const SignUpView());
        },
        color: kPrimaryColor,
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.5 + 218 + 70,
      left: 26,
      right: 26,
      child: CustomButton(
        text: 'Log In',
        onPressed: () {
          context.navigateTo(const LoginScreenView());
        },
        color: kSecondryColor,
      ),
    );
  }
}
