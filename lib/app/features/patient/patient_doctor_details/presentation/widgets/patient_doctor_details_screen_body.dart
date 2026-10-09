import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/doctor_info_card.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/doctor_location_section.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/services_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDoctorDetailsScreenBody extends StatelessWidget {
  const PatientDoctorDetailsScreenBody({required this.doctor, super.key});

  final DoctorModel doctor;

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
          DoctorInfoCard(doctor: doctor),

          32.height,

          const ServicesSection(),

          32.height,

          const DoctorLocationSection(),
        ],
      ),
    );
  }
}
