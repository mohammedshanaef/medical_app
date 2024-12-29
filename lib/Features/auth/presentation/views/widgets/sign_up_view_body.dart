import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:medical_app/Features/auth/presentation/views/login_screen_view.dart';
import 'package:medical_app/Features/auth/presentation/views/widgets/promoting_text.dart';
import 'package:medical_app/Features/auth/presentation/views/widgets/social_icon_row.dart';
import 'package:medical_app/Features/auth/presentation/view_model.dart/auth_cubit.dart';
import 'package:medical_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:medical_app/constant.dart';
import 'package:medical_app/core/utils/custom_Text_field.dart';
import 'package:medical_app/core/utils/custom_button.dart';
import 'package:medical_app/core/utils/styles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 39),
                const Center(
                  child: Text(
                    'Sign Up',
                    style: Styles.text40,
                  ),
                ),
                const SizedBox(height: 80),
                const SignUpFieldTitle(title: 'Name'),
                CustomTextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const SignUpFieldTitle(title: 'Phone Number'),
                CustomTextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SignUpFieldTitle(title: 'Password'),
                CustomTextFormField(
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const SignUpFieldTitle(title: 'Confirm Password'),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SignUpButton(
                  formKey: _formKey,
                  nameController: nameController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
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
                  promptText: 'Have An Account?',
                  actionText: 'Log In',
                  onPressed: () {
                    Get.to(
                      const LoginScreenView(),
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpFieldTitle extends StatelessWidget {
  final String title;

  const SignUpFieldTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            text: 'Sign Up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).signUp(
                  name: nameController.text.trim(),
                  phone: phoneController.text.trim(),
                  password: passwordController.text.trim(),
                );
              }
            },
            color: kPrimaryColor,
          ),
        );
      },
    );
  }
}
