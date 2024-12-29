import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/auth/presentation/views/login_screen_view.dart';
import 'package:medical_app/core/utils/custom_Text_field.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';
import 'package:medical_app/helper.dart';

class EnterPasswordViewBody extends StatelessWidget {
  const EnterPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 78),
              const Center(
                child: Text(
                  'Enter New Password',
                  style: Styles.text32,
                ),
              ),
              const SizedBox(height: 188),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              const CustomTextFormField(
                isPassword: true,
              ),
              const SizedBox(height: 26),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Confirm Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              const CustomTextFormField(
                isPassword: true,
              ),
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    context.navigateTo(
                      const LoginScreenView(),
                      delay: const Duration(seconds: 1),
                      transition: Transition.fadeIn,
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
