import 'package:doctor_hunt/app/core/theme/app_colors.dart';
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
        return _buildGradient(AppColors.dentalGradientColors);
      case DoctorSpecialty.cardiologist:
        return _buildGradient(AppColors.cardiologyGradientColors);
      case DoctorSpecialty.ophthalmologist:
        return _buildGradient(AppColors.ophthalmologyGradientColors);
      case DoctorSpecialty.dermatologist:
        return _buildGradient(AppColors.dermatologyGradientColors);
    }
  }

  LinearGradient _buildGradient(List<Color> colors) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors,
    );
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
