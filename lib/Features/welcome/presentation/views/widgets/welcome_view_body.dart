import 'package:flutter/material.dart';
import 'package:medical_app/Features/welcome/presentation/views/widgets/welcome_view_body_item.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelocmeViewBodyItems(),
    );
  }
}
