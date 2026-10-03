import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum DoctorStatus {
  active,
  inactive;

  String get title {
    return switch (this) {
      DoctorStatus.active => t.active,
      DoctorStatus.inactive => t.inactive,
    };
  }

  factory DoctorStatus.fromValue(String value) {
    return switch (value) {
      'active' => DoctorStatus.active,
      'inactive' => DoctorStatus.inactive,
      _ => DoctorStatus.active,
    };
  }

  String get value {
    return switch (this) {
      DoctorStatus.active => 'active',
      DoctorStatus.inactive => 'inactive',
    };
  }

  Color get color {
    return switch (this) {
      DoctorStatus.active => AppColors.cardiology,
      DoctorStatus.inactive => AppColors.inactive,
    };
  }

  Color get backgroundColor {
    return switch (this) {
      DoctorStatus.active => AppColors.activeLight,
      DoctorStatus.inactive => AppColors.inactiveLight,
    };
  }
}
