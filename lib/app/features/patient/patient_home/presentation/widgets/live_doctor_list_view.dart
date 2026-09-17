import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/live_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDoctorsListView extends StatelessWidget {
  const LiveDoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 6.w),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const LiveDoctorCard();
      },
    );
  }
}
