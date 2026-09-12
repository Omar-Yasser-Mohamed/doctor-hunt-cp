import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/login_screen_widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(body: LoginScreenBody()),
    );
  }
}
