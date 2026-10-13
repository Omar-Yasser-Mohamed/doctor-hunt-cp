import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/logout_button.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/patient_account_settings_section.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/patient_more_options_section.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/patient_settings_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientSettingsScreenBody extends StatelessWidget {
  const PatientSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PatientSettingsProfileCard(),

          24.height,

          const PatientAccountSettingsSection(),

          24.height,

          const PatientMoreOptionsSection(),

          45.height,

          const LogoutButton(),
        ],
      ),
    );
  }
}
