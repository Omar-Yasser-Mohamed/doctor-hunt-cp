import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum UserRole {
  patient,
  admin;

  String label(BuildContext context) => switch (this) {
    UserRole.admin => context.t.common.admin,
    UserRole.patient => context.t.common.patient,
  };

  String description(BuildContext context) => switch (this) {
    UserRole.admin => context.t.chooseRole.adminDescription,
    UserRole.patient => context.t.chooseRole.patientDescription,
  };

  IconData get unselectedIcon => switch (this) {
    UserRole.admin => Icons.dashboard_outlined,
    UserRole.patient => Icons.person_outline,
  };

  IconData get selectedIcon => switch (this) {
    UserRole.admin => Icons.dashboard_rounded,
    UserRole.patient => Icons.person_rounded,
  };
}
