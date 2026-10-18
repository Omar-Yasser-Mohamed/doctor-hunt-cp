import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorite_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridLayoutConfig {
  const GridLayoutConfig({
    required this.crossAxisCount,
    required this.childAspectRatio,
    this.crossAxisSpacing = 16,
    this.mainAxisSpacing = 16,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
}

class PatientFavoriteDoctorsGridView extends StatelessWidget {
  const PatientFavoriteDoctorsGridView({
    super.key,
    required this.doctors,
  });

  final List<DoctorModel> doctors;

  GridLayoutConfig configFor(double width) {
    if (width < 600) {
      return const GridLayoutConfig(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
      );
    }

    if (width < 1024) {
      return const GridLayoutConfig(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
      );
    }

    return const GridLayoutConfig(
      crossAxisCount: 5,
      childAspectRatio: 1.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = configFor(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16, bottom: 100.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: config.crossAxisCount,
        crossAxisSpacing: config.crossAxisSpacing,
        mainAxisSpacing: config.mainAxisSpacing,
        childAspectRatio: config.childAspectRatio,
      ),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return PatientFavoriteDoctorCard(
          key: ValueKey(doctor.id),
          doctor: doctor,
        );
      },
    );
  }
}
