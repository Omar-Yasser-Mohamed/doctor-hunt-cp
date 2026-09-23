import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/home_section_title.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/popular_doctors_list_view.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionTitle(title: t.popularDoctor),
        22.height,

        SizedBox(
          height: 250.h,
          child: const PopularDoctorsListView(),
        ),
      ],
    );
  }
}
