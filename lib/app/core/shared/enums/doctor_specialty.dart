import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

enum DoctorSpecialty {
  dentist,
  cardiologist,
  ophthalmologist,
  dermatologist;

  LinearGradient get linarGradient {
    switch (this) {
      case DoctorSpecialty.dentist:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2753F3),
            Color(0xFF765AFC),
          ],
        );
      case DoctorSpecialty.cardiologist:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0EBE7E),
            Color(0xFF07D9AD),
          ],
        );
      case DoctorSpecialty.ophthalmologist:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFE7F44),
            Color(0xFFFFCF68),
          ],
        );
      case DoctorSpecialty.dermatologist:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF484C),
            Color(0xFFFF6C60),
          ],
        );
    }
  }

  String get svgIcon {
    switch (this) {
      case DoctorSpecialty.dentist:
        return AppIcons.dentist;
      case DoctorSpecialty.cardiologist:
        return AppIcons.cardiologist;
      case DoctorSpecialty.ophthalmologist:
        return AppIcons.ophthalmologist;
      case DoctorSpecialty.dermatologist:
        return AppIcons.dermatologist;
    }
  }
}
