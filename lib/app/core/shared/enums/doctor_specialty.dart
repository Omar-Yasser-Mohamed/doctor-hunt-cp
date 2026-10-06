import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum DoctorSpecialty {
  dentist,
  cardiologist,
  ophthalmologist,
  dermatologist;

  String get title {
    return switch (this) {
      DoctorSpecialty.dentist => t.dentist,
      DoctorSpecialty.cardiologist => t.cardiologist,
      DoctorSpecialty.ophthalmologist => t.ophthalmologist,
      DoctorSpecialty.dermatologist => t.dermatologist,
    };
  }

  factory DoctorSpecialty.fromValue(String value) {
    switch (value) {
      case 'dentist':
        return DoctorSpecialty.dentist;
      case 'cardiologist':
        return DoctorSpecialty.cardiologist;
      case 'ophthalmologist':
        return DoctorSpecialty.ophthalmologist;
      case 'dermatologist':
        return DoctorSpecialty.dermatologist;
      default:
        throw Exception('Unknown specialty: $value');
    }
  }

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
