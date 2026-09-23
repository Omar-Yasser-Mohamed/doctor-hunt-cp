import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/bottom_sheet_header.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/reset_password_form.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetHeader(
          title: t.resetPassword,
          description: t.resetPasswordDescription,
        ),

        27.height,

        const ResetPasswordForm(),
      ],
    );
  }
}
