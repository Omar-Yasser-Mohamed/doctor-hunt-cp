import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/book_appointment.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientBookingService {
  Future<DoctorAvailabilityModel> getDoctorAvailability({
    required String doctorId,
  });

  Future<List<AppointmentModel>> getDoctorAppointments({
    required String doctorId,
    required DateTime date,
  });

  Future<void> bookAppointment(BookAppointment bookAppointment);
}

@LazySingleton(as: PatientBookingService)
class PatientBookingServiceImpl implements PatientBookingService {
  PatientBookingServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<DoctorAvailabilityModel> getDoctorAvailability({
    required String doctorId,
  }) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.doctorAvailabilityTable)
        .select()
        .eq('doctor_id', doctorId)
        .single();

    return DoctorAvailabilityModel.fromJson(response);
  }

  @override
  Future<List<AppointmentModel>> getDoctorAppointments({
    required String doctorId,
    required DateTime date,
  }) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final startOfNextDay = startOfDay.add(const Duration(days: 1));

    final startUtc = startOfDay.toUtc();
    final endUtc = startOfNextDay.toUtc();

    final response = await _supabaseClient
        .from(SupabaseConstants.appointmentsTable)
        .select()
        .eq('doctor_id', doctorId)
        .gte('appointment_at', startUtc.toIso8601String())
        .lt('appointment_at', endUtc.toIso8601String());

    return response
        .map<AppointmentModel>(
          (json) => AppointmentModel.fromJson(json),
        )
        .toList();
  }

  @override
  Future<void> bookAppointment(BookAppointment bookAppointment) async {
    await _supabaseClient.rpc(
      SupabaseConstants.bookAppointmentProcedure,
      params: bookAppointment.toRpcParams(),
    );
  }
}
