import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/home_section_title.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/live_doctor_list_view.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDoctorsSection extends StatelessWidget {
  const LiveDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionTitle(
          title: t.home.liveDoctors,
          showSeeAll: false,
        ),

        16.height,

        SizedBox(
          height: 168.h,
          child: const LiveDoctorsListView(),
        ),
      ],
    );
  }
}

