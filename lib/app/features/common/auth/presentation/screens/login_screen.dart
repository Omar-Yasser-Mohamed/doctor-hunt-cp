import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(child: LoginScreenBody());
  }
}
