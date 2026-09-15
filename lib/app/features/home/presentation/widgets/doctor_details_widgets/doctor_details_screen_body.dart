import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/doctor_details_widgets/doctor_info_card.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/doctor_details_widgets/doctor_location_section.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/doctor_details_widgets/doctor_stats_card.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/doctor_details_widgets/services_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreenBody extends StatelessWidget {
  const DoctorDetailsScreenBody({super.key});

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
