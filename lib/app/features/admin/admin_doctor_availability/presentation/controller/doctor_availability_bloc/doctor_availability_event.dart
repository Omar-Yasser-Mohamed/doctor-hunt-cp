part of 'doctor_availability_bloc.dart';

sealed class DoctorAvailabilityEvent {
  const DoctorAvailabilityEvent();
}

class GetDoctorAvailabilityEvent extends DoctorAvailabilityEvent {
  final String doctorId;
  const GetDoctorAvailabilityEvent(this.doctorId);
}

class ToggleWorkingDayEvent extends DoctorAvailabilityEvent {
  final WeekDay day;
  const ToggleWorkingDayEvent(this.day);
}

class ChangeStartTimeEvent extends DoctorAvailabilityEvent {
  final TimeOfDay startTime;
  const ChangeStartTimeEvent(this.startTime);
}

class ChangeEndTimeEvent extends DoctorAvailabilityEvent {
  final TimeOfDay endTime;
  const ChangeEndTimeEvent(this.endTime);
}

class ChangeSlotDurationEvent extends DoctorAvailabilityEvent {
  final int slotDuration;
  const ChangeSlotDurationEvent(this.slotDuration);
}

class SaveDoctorAvailabilityEvent extends DoctorAvailabilityEvent {
  const SaveDoctorAvailabilityEvent();
}
