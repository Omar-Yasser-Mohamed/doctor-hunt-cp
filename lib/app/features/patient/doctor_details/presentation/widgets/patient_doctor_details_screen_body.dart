import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/widgets/doctor_info_card.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/widgets/doctor_location_section.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/widgets/doctor_stats_card.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/widgets/services_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDoctorDetailsScreenBody extends StatelessWidget {
  const PatientDoctorDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 20,
        left: 20.w,
        right: 20.w,
        bottom: context.bottomPadding + 20,
      ),
      child: Column(
        children: [
          const DoctorInfoCard(),

          24.height,

          const DoctorStatsCard(),

          27.height,

          const ServicesSection(),

          30.height,

          const DoctorLocationSection(),
        ],
      ),
    );
  }
}
