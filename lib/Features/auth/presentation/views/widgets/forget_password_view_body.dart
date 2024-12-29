import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/auth/presentation/views/verfication_view.dart';
import 'package:medical_app/Features/auth/presentation/views/widgets/social_icon_row.dart';
import 'package:medical_app/constant.dart';
import 'package:medical_app/core/utils/custom_Text_field.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';
import 'package:medical_app/helper.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        isButtonEnabled = emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                  'Forget Password?',
                  style: Styles.text40,
                ),
              ),
              const SizedBox(height: 250),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Enter Email Address'),
              ),
              CustomTextFormField(
                controller: emailController,
              ),
              const SizedBox(height: 125),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    if (isButtonEnabled) {
                      context.navigateOffTo(
                        const VerficationView(),
                        delay: const Duration(seconds: 1),
                        transition: Transition.zoom,
                        duration: const Duration(seconds: 1),
                      );
                    }
                  },
                  color: isButtonEnabled ? kPrimaryColor : Colors.grey,
                ),
              ),
              const Center(
                child: Text(
                  'Or',
                  style: Styles.text16,
                ),
              ),
              const SizedBox(height: 21),
              const SocialIconsRow(),
            ],
          ),
        ),
      ),
    );
  }
}
