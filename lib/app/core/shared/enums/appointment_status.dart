import 'dart:ui';

import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/translations.g.dart';

enum AppointmentStatus {
  upcoming,
  completed,
  cancelled;

  String get title {
    switch (this) {
      case AppointmentStatus.upcoming:
        return t.upcoming;
      case AppointmentStatus.completed:
        return t.completed;
      case AppointmentStatus.cancelled:
        return t.cancelled;
    }
  }

  String get value {
    switch (this) {
      case AppointmentStatus.upcoming:
        return "upcoming";
      case AppointmentStatus.completed:
        return "completed";
      case AppointmentStatus.cancelled:
        return "cancelled";
    }
  }

  static AppointmentStatus fromValue(String value) {
    switch (value) {
      case "upcoming":
        return AppointmentStatus.upcoming;
      case "completed":
        return AppointmentStatus.completed;
      case "cancelled":
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.upcoming;
    }
  }

  Color get backgroundColor => switch (this) {
    AppointmentStatus.upcoming => AppColors.activeLight,
    AppointmentStatus.completed => AppColors.activeLight,
    AppointmentStatus.cancelled => AppColors.inactiveLight,
  };

  Color get color => switch (this) {
    AppointmentStatus.upcoming => AppColors.primary,
    AppointmentStatus.completed => AppColors.primary,
    AppointmentStatus.cancelled => AppColors.inactive,
  };
}