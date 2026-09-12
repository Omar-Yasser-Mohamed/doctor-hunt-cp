import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/forget_password_bottom_sheet.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ForgetPasswordBottomSheet.show(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          context.t.auth.forgotPassword,
          style: context.regular14Primary,
        ),
      ),
    );
  }
}
