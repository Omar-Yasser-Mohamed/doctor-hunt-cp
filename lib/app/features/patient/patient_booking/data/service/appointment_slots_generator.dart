import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/appointment_slot.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppointmentSlotsGenerator {
  List<AppointmentSlot> generateSlots({
    required DoctorAvailabilityModel availability,
    required List<AppointmentModel> appointments,
    required DateTime date,
  }) {
    if (!availability.workingDays.contains(date.workWeekDay)) {
      return [];
    }

    final startMinutes =
        availability.startTime.hour * 60 + availability.startTime.minute;

    final endMinutes =
        availability.endTime.hour * 60 + availability.endTime.minute;

    final duration = availability.slotDuration;

    if (duration <= 0 || startMinutes >= endMinutes) {
      return [];
    }

    final bookedTimes = appointments
        .where(
          (e) => e.status != AppointmentStatus.cancelled,
        )
        .map((e) => e.appointmentAt)
        .toList();

    final List<AppointmentSlot> slots = [];

    for (int mins = startMinutes; mins < endMinutes; mins += duration) {
      final slotDate = DateTime(
        date.year,
        date.month,
        date.day,
        mins ~/ 60,
        mins % 60,
      );

      if (slotDate.isBefore(DateTime.now())) continue;

      final isBooked = bookedTimes.any(
        (bookedAt) => bookedAt.isAtSameMomentAs(slotDate),
      );

      if (!isBooked) {
        slots.add(AppointmentSlot(date: slotDate));
      }
    }
    return slots;
  }
}
