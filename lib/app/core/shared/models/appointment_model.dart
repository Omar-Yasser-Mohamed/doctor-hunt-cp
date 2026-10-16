import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime appointmentAt;
  final AppointmentStatus status;
  final String createdAt;

  const AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.appointmentAt,
    required this.status,
    required this.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    id: json['id'],
    doctorId: json['doctor_id'],
    patientId: json['patient_id'],
    appointmentAt: DateTime.parse(json['appointment_at']),
    status: AppointmentStatus.fromValue(json['status']),
    createdAt: json['created_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor_id': doctorId,
    'patient_id': patientId,
    'appointment_at': appointmentAt.toIso8601String(),
    'status': status.value,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props => [
    id,
    doctorId,
    patientId,
    appointmentAt,
    status,
    createdAt,
  ];
}