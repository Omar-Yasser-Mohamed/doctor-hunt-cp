import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorites_doctors_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientFavoriteDoctorsScreen extends StatelessWidget {
  const PatientFavoriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        titleSpacing: 20.w,
        title: Text(
          t.favouriteDoctors,
          style: context.medium18TextMain,
        ),
      ),
      child: const PatientFavoritesDoctorsScreenBody(),
    );
  }
}
