import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';

abstract class AppEvent {}

class DoctorCreatedEvent implements AppEvent {
  final DoctorModel doctor;
  DoctorCreatedEvent({required this.doctor});
}
