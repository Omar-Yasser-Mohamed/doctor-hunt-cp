import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppointmentsService {
  Future<AppointmentModel> getAppointmentDetails(String appointmentId);
  Future<void> cancelAppointment(String appointmentId);
}

@LazySingleton(as: AppointmentsService)
class AppointmentsServiceImpl implements AppointmentsService {
  AppointmentsServiceImpl(this._client);
  final SupabaseClient _client;

  @override
  Future<AppointmentModel> getAppointmentDetails(String appointmentId) async {
    final response = await _client
        .from(SupabaseConstants.appointmentsTable)
        .select('''
      *,
      doctor:doctors(
        *,
        admins(*)
      ),
      patient:users(*),
      review:appointment_reviews(*)
    ''')
        .eq('id', appointmentId)
        .single();

    return AppointmentModel.fromJson(response);
  }

  @override
  Future<void> cancelAppointment(String appointmentId) async {
    final response = await _client
        .from(SupabaseConstants.appointmentsTable)
        .update({'status': AppointmentStatus.cancelled.value})
        .eq('id', appointmentId)
        .eq('status', AppointmentStatus.upcoming.value)
        .select('id, status')
        .maybeSingle();

    if (response == null || response['status'] != 'cancelled') {
      throw const AppointmentCouldNotBeCancelledException();
    }
  }
}
