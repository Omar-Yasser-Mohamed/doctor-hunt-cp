import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/widgets/doctor_details_actions.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/widgets/doctor_profile_section.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/widgets/doctor_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorDetailsScreenBody extends StatelessWidget {
  const AdminDoctorDetailsScreenBody({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 16,
        right: 20.w,
        bottom: context.bottomPadding + 24,
      ),
      child: Column(
        children: [
          DoctorProfileSection(doctor: doctor),

          20.height,

          DoctorSummaryCard(doctor: doctor),

          24.height,

          DoctorDetailsActions(doctor: doctor),
        ],
      ),
    );
  }
}
