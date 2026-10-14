import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorite_doctors_bloc_builder.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorite_doctors_search_bar.dart';
import 'package:flutter/material.dart';

class PatientFavoritesDoctorsScreenBody extends StatefulWidget {
  const PatientFavoritesDoctorsScreenBody({
    super.key,
    this.doctors = const [],
  });

  final List<DoctorModel> doctors;

  @override
  State<PatientFavoritesDoctorsScreenBody> createState() =>
      _PatientFavoritesDoctorsScreenBodyState();
}

class _PatientFavoritesDoctorsScreenBodyState
    extends State<PatientFavoritesDoctorsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.height,

        const PatientFavoriteDoctorsSearchBar(),

        8.height,

        const Expanded(child: PatientFavoriteDoctorsBlocBuilder()),
      ],
    );
  }
}
