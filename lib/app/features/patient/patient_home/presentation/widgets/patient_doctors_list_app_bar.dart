import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';

class PatientDoctorsListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PatientDoctorsListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final doctorsFilter = context.extra<DoctorsFilter>();
    return AppBar(
      leading: const AppBackButton(),
      title: Text(
        doctorsFilter.title,
        style: context.regular18.copyWith(
          color: AppColors.textDark,
          letterSpacing: -0.3,
        ),
      ),
    );
  }
}
