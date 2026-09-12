import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/register_widgets/register_screen_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(
        body: RegisterScreenBody(),
      ),
    );
  }
}
