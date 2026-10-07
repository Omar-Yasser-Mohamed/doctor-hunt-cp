import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_info_card.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_save_button.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_working_days_card.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_working_hours_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityScreenBody extends StatelessWidget {
  const AdminDoctorAvailabilityScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      child: Column(
        children: [
          const AdminDoctorAvailabilityInfoCard(),

          14.height,

          const AdminDoctorAvailabilityWorkingDaysCard(),

          14.height,

          const AdminDoctorAvailabilityWorkingHoursCard(),

          18.height,

          const AdminDoctorAvailabilitySaveButton(),
        ],
      ),
    );
  }
}
