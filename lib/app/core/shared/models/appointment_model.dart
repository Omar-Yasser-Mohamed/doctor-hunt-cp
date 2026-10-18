import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/models/appointment_review.dart';
import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime appointmentAt;
  final AppointmentStatus status;
  final String createdAt;

  final DoctorModel? doctor;
  final UserModel? patient;
  final AppointmentReview? review;

  const AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.appointmentAt,
    required this.status,
    required this.createdAt,
    this.doctor,
    this.patient,
    this.review,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        id: json['id'],
        doctorId: json['doctor_id'],
        patientId: json['patient_id'],
        appointmentAt: DateTime.parse(json['appointment_at']).toLocal(),
        status: AppointmentStatus.fromValue(json['status']),
        createdAt: json['created_at'],
        doctor: json['doctor'] != null
            ? DoctorModel.fromJson(json['doctor'])
            : null,
        patient: json['patient'] != null
            ? UserModel.fromJson(json['patient'])
            : null,
        review: json['review'] != null
            ? AppointmentReview.fromJson(json['review'])
            : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor_id': doctorId,
    'patient_id': patientId,
    'appointment_at': appointmentAt.toIso8601String(),
    'status': status.value,
    'created_at': createdAt,
    if (doctor != null) 'doctor': doctor!.toJson(),
    if (patient != null) 'patient': patient!.toJson(),
    if (review != null) 'review': review!.toJson(),
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
