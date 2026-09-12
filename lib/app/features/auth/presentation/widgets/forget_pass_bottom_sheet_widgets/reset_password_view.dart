import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/bottom_sheet_header.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/reset_password_form.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.onSuccess});
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetHeader(
          title: context.t.auth.resetPassword,
          description: context.t.auth.resetPasswordDescription,
        ),

        27.height,

        ResetPasswordForm(onSuccess: onSuccess),
      ],
    );
  }
}
