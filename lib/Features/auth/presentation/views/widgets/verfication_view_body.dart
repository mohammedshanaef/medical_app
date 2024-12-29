import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medical_app/Features/auth/presentation/views/enter_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 78),
              VerificationHeader(),
              SizedBox(height: 250),
              VerificationTitle(),
              SizedBox(height: 20),
              VerificationCodeFields(),
              SizedBox(height: 42),
              ResendText(),
              SizedBox(height: 93),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Verification',
        style: Styles.text32,
      ),
    );
  }
}

class VerificationTitle extends StatelessWidget {
  const VerificationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter Verification Code',
      style: Styles.text16,
    );
  }
}

class VerificationCodeFields extends StatelessWidget {
  const VerificationCodeFields({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16),
        fieldHeight: 60,
        fieldWidth: 60,
        activeColor: Colors.teal,
        selectedColor: Colors.grey,
        inactiveColor: Colors.grey.shade300,
      ),
    );
  }
}

class ResendText extends StatelessWidget {
  const ResendText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "If You Didn't Receive A Code, ",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'Resend',
            style: TextStyle(
              color: Colors.teal,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Enter Code',
      onPressed: () {
        Get.off(
          EnterPasswordView(),
          duration: Duration(seconds: 2),
          transition: Transition.zoom,
        );
        Future.delayed(Duration(seconds: 2));
      },
    );
  }
}
