import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/bottom_sheet_header.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/forget_password_form.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key, required this.onContinue});
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetHeader(
          title: context.t.auth.forgotPassword,
          description: context.t.auth.forgotPasswordDescription,
        ),

        36.height,

        ForgetPasswordForm(
          onContinue: onContinue,
        ),
      ],
    );
  }
}
