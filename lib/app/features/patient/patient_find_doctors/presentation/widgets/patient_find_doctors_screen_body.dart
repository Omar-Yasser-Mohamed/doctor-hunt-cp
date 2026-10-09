import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/widgets/find_doctors_search_bar.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/widgets/patient_find_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

class PatientFindDoctorsScreenBody extends StatelessWidget {
  const PatientFindDoctorsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.height,

        const FindDoctorsSearchBar(),

        8.height,

        const Expanded(child: PatientFindDoctorsBlocBuilder()),
      ],
    );
  }
}
