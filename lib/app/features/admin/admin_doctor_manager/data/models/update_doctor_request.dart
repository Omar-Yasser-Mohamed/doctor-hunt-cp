import 'dart:io';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';

class UpdateDoctorRequest {
  final String id;
  final String? name;
  final DoctorSpecialty? specialty;
  final double? fees;
  final bool? isActive;
  final File? photo;

  const UpdateDoctorRequest({
    required this.id,
    this.name,
    this.specialty,
    this.fees,
    this.isActive,
    this.photo,
  });

  Map<String, dynamic> toUpdateJson({String? photoPath}) {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (specialty != null) data['specialty'] = specialty!.name;
    if (fees != null) data['fees'] = fees;
    if (isActive != null) data['is_active'] = isActive;
    if (photoPath != null) data['photo'] = photoPath;
    return data;
  }
}
