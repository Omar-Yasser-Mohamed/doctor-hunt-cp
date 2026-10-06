import 'dart:io';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';

class CreateDoctorRequest {
  final String name;
  final DoctorSpecialty specialty;
  final File? photo;
  final double fees;

  const CreateDoctorRequest({
    required this.name,
    required this.specialty,
    this.photo,
    required this.fees,
  });

  Map<String, dynamic> toJson({
    required String adminId,
    String? photoPath,
  }) {
    return {
      'admin_id': adminId,
      'name': name,
      'specialty': specialty.name,
      'photo': photoPath,
      'fees': fees,
    };
  }
}