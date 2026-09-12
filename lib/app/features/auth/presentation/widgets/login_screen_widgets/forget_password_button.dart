import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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