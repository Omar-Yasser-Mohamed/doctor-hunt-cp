import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/choose_role_widgets/choose_role_screen_body.dart';
import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Scaffold(
        body: ChooseRoleScreenBody(),
      ),
    );
  }
}