import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/auth/presentation/views/forget_password_view.dart';
import 'package:medical_app/Features/auth/presentation/views/sign_up_view.dart';
import 'package:medical_app/Features/auth/presentation/views/widgets/promoting_text.dart';
import 'package:medical_app/Features/auth/presentation/views/widgets/social_icon_row.dart';
import 'package:medical_app/Features/auth/presentation/view_model.dart/auth_cubit.dart';
import 'package:medical_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:medical_app/constant.dart';
import 'package:medical_app/core/utils/custom_Text_field.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';

class LoginScreenViewBody extends StatelessWidget {
  const LoginScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 39),
              const Center(
                child: Text(
                  'Log In',
                  style: Styles.text40,
                ),
              ),
              const SizedBox(height: 80),
              const LoginForm(),
              const SizedBox(height: 38),
              const Center(
                child: Text(
                  'Or',
                  style: Styles.text16,
                ),
              ),
              const SizedBox(height: 23),
              const SocialIconsRow(),
              const SizedBox(height: 20),
              PromotingText(
                promptText: 'Don’t have an account?',
                actionText: 'Sign Up',
                onPressed: () {
                  Get.to(const SignUpView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          const ForgetPasswordButton(),
          const SizedBox(height: 40),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Get.offAll(() => const HomeScreenView());
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButton(
                text: 'Log In',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    BlocProvider.of<AuthCubit>(context).login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
                color: kPrimaryColor,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const ForgetPasswordView(),
          duration: const Duration(seconds: 2),
        );
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forget Password ?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
