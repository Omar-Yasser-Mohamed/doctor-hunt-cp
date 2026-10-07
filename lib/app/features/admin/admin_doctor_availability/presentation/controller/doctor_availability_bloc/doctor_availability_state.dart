part of 'doctor_availability_bloc.dart';

class DoctorAvailabilityState extends Equatable {
  const DoctorAvailabilityState({
    this.originalAvailability,
    this.updatedAvailability,
  });
  final DoctorAvailabilityModel? originalAvailability;
  final DoctorAvailabilityModel? updatedAvailability;

  bool get hasChanges {
    if (originalAvailability == null || updatedAvailability == null) {
      return false;
    }

    final original = originalAvailability!;
    final updated = updatedAvailability!;

    return !setEquals(
          original.workingDays.toSet(),
          updated.workingDays.toSet(),
        ) ||
        original.startTime != updated.startTime ||
        original.endTime != updated.endTime ||
        original.slotDuration != updated.slotDuration;
  }

  @override
  List<Object?> get props => [originalAvailability, updatedAvailability];
}

class DoctorAvailabilityInitial extends DoctorAvailabilityState {}

class GetDoctorAvailabilityLoading extends DoctorAvailabilityState {}

class GetDoctorAvailabilitySuccess extends DoctorAvailabilityState {
  const GetDoctorAvailabilitySuccess({
    required super.originalAvailability,
    required super.updatedAvailability,
  });

  @override
  List<Object?> get props => [
    originalAvailability,
    updatedAvailability,
  ];
}

class GetDoctorAvailabilityFailure extends DoctorAvailabilityState {
  final Failure failure;

  const GetDoctorAvailabilityFailure({
    required this.failure,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    failure,
  ];
}

class DoctorAvailabilityEditing extends DoctorAvailabilityState {
  const DoctorAvailabilityEditing({
    required super.originalAvailability,
    required super.updatedAvailability,
  });

  @override
  List<Object?> get props => [
    originalAvailability,
    updatedAvailability,
  ];
}

class SaveDoctorAvailabilityLoading extends DoctorAvailabilityState {
  const SaveDoctorAvailabilityLoading({
    required super.originalAvailability,
    required super.updatedAvailability,
  });

  @override
  List<Object?> get props => [
    originalAvailability,
    updatedAvailability,
  ];
}

class SaveDoctorAvailabilitySuccess extends DoctorAvailabilityState {
  const SaveDoctorAvailabilitySuccess({
    required super.originalAvailability,
    required super.updatedAvailability,
  });

  @override
  List<Object?> get props => [
    originalAvailability,
    updatedAvailability,
  ];
}

class SaveDoctorAvailabilityFailure extends DoctorAvailabilityState {
  final Failure failure;

  const SaveDoctorAvailabilityFailure({
    required super.originalAvailability,
    required super.updatedAvailability,
    required this.failure,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    failure,
  ];
}
