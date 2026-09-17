import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.t.auth.haveAnAccount,
            style: context.regular14Primary,
          ),

          TextSpan(
            text: ' ',
            style: context.regular14Primary,
          ),

          TextSpan(
            text: context.t.auth.logIn,
            style: context.medium14Primary,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pop();
              },
          ),
        ],
      ),
    );
  }
}
