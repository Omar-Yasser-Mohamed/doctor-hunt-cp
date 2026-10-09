import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/widgets/patient_find_doctors_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PatientFindDoctorsScreen extends StatelessWidget {
  const PatientFindDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          t.findDoctors,
          style: context.regular18.copyWith(color: AppColors.textDark),
        ),
      ),
      child: const PatientFindDoctorsScreenBody(),
    );
  }
}
