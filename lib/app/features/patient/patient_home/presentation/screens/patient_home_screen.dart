import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/patient_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      topPos: 100.h,
      bottomPos: 10.h,
      child: const PatientHomeScreenBody(),
    );
  }
}
