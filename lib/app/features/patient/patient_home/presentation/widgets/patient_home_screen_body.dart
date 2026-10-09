import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/categories_list_view.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/top_rated_doctors_section.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/home_header.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/popular_doctors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientHomeScreenBody extends StatelessWidget {
  const PatientHomeScreenBody({
    super.key,
    required this.popularDoctors,
    required this.topRatedDoctors,
  });
  final List<DoctorModel> popularDoctors;
  final List<DoctorModel> topRatedDoctors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(bottom: 108.h),
      child: Column(
        children: [
          const HomeHeader(),

          12.height,

          SizedBox(
            height: 90.h,
            child: const CategoriesListView(),
          ),

          30.height,

          PopularDoctorsSection(
            doctors: popularDoctors,
          ),

          30.height,

          TopRatedDoctorsSection(
            doctors: topRatedDoctors,
          ),
        ],
      ),
    );
  }
}
