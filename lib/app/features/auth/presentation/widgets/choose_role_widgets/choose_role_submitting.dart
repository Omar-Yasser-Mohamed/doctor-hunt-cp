import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseRoleSubmitting extends StatelessWidget {
  const ChooseRoleSubmitting({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: context.t.common.kContinue,
      onPressed: () {
        context.push(AppRoutes.loginScreen);
      },
    );
  }
}
