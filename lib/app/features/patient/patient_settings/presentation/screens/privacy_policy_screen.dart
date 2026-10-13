import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/privacy_policy_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          t.privacyPolicy,
          style: context.medium18TextMain,
        ),
      ),
      child: const PrivacyPolicyScreenBody(),
    );
  }
}
