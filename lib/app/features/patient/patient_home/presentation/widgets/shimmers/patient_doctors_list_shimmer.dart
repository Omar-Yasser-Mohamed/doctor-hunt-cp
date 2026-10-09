import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/doctor_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shimmer list matching [PatientDoctorsListView] in [PatientDoctorsListScreen].
class PatientDoctorsListShimmer extends StatelessWidget {
  const PatientDoctorsListShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 16,
        bottom: context.bottomPadding + 8,
        left: 20.w,
        right: 20.w,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => const DoctorCardShimmer(),
    );
  }
}
