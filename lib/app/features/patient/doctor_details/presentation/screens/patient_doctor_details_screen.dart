import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/widgets/patient_doctor_details_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDoctorDetailsScreen extends StatelessWidget {
  const PatientDoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          t.doctorDetails,
          style: context.medium18TextMain,
        ),
        actions: [
          const Icon(
            Icons.search_outlined,
            color: AppColors.textSub,
            size: 24,
          ),

          (20.w).width,
        ],
      ),
      child: const PatientDoctorDetailsScreenBody(),
    );
  }
}
