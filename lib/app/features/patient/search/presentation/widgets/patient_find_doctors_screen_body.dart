import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/patient/search/presentation/widgets/doctors_search_bar.dart';
import 'package:doctor_hunt/app/features/patient/search/presentation/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';

class PatientFindDoctorsScreenBody extends StatelessWidget {
  const PatientFindDoctorsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.height,

        const DoctorsSearchBar(),

        8.height,

        const Expanded(child: DoctorsListView()),
      ],
    );
  }
}
