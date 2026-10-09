import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/top_rated_doctor_list_view.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/home_section_title.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRatedDoctorsSection extends StatelessWidget {
  const TopRatedDoctorsSection({
    super.key,
    required this.doctors,
  });
  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionTitle(
          title: t.topRatedDoctors,
          onSeeAll: () {
            const PatientDoctorsListRoute(
              $extra: DoctorsFilter(type: DoctorsListType.topRated),
            ).push(context);
          },
        ),

        22.height,

        SizedBox(
          height: 130.h,
          child:  TopRatedDoctorsListView(doctors: doctors),
        ),
      ],
    );
  }
}
