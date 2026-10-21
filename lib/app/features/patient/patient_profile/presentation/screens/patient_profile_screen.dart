import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/widgets/patient_profile_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showTopDecoration: false,
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        scrolledUnderElevation: 0,
        bottomOpacity: 0,
        leading: const AppBackButton(),
        title: Text(
          t.profile,
          style: context.medium18White,
        ),
      ),
      child: const PatientProfileScreenBody(),
    );
  }
}
