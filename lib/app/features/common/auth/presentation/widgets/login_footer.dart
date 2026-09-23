import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
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
            text: t.dontHaveAnAccount,
            style: context.regular14Primary,
          ),

          TextSpan(
            text: ' ',
            style: context.regular14Primary,
          ),

          TextSpan(
            text: t.joinUs,
            style: context.medium14Primary,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final userRole = context.extra<UserRole>();
                RegisterRoute($extra: userRole).push(context);
              },
          ),
        ],
      ),
    );
  }
}
