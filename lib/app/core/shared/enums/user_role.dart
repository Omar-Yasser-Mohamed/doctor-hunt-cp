import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum UserRole {
  patient,
  admin;

  String get value => switch (this) {
    UserRole.admin => 'admin',
    UserRole.patient => 'patient',
  };

  static UserRole fromValue(String value) => switch (value) {
    'admin' => UserRole.admin,
    'patient' => UserRole.patient,
    _ => throw InvalidRoleException(),
  };

  String get label => switch (this) {
    UserRole.admin => t.admin,
    UserRole.patient => t.patient,
  };

  String get description => switch (this) {
    UserRole.admin => t.adminDescription,
    UserRole.patient => t.patientDescription,
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
