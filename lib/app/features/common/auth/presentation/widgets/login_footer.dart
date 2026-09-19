import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.t.auth.dontHaveAnAccount,
            style: context.regular14Primary,
          ),

          TextSpan(
            text: ' ',
            style: context.regular14Primary,
          ),

          TextSpan(
            text: context.t.auth.joinUs,
            style: context.medium14Primary,
            recognizer: TapGestureRecognizer()..onTap = () {
              const RegisterRoute().push(context);
            },
          ),
        ],
      ),
    );
  }
}
