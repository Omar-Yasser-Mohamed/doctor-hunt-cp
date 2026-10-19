import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/models/create_appointment_review.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientAppointmentsService {
  Future<List<AppointmentModel>> getPatientAppointments({
    required AppointmentStatus status,
    int? page,
    int? limit,
  });
  Future<AppointmentModel> createAppointmentReview(
    CreateAppointmentReviewRequest request,
  );
}

@LazySingleton(as: PatientAppointmentsService)
class PatientAppointmentsServiceImpl implements PatientAppointmentsService {
  final SupabaseClient _supabaseClient;

  PatientAppointmentsServiceImpl(this._supabaseClient);

  @override
  Future<List<AppointmentModel>> getPatientAppointments({
    required AppointmentStatus status,
    int? page,
    int? limit,
  }) async {
    final id = _supabaseClient.auth.currentUser!.id;

    final currentPage = page ?? 1;
    final pageSize = limit ?? 10;
    final from = (currentPage - 1) * pageSize;
    final to = from + pageSize - 1;

    final response = await _supabaseClient
        .from(SupabaseConstants.appointmentsTable)
        .select(
          '''
          *,
          doctor:doctors(
            *,
            admins(*)
          ),
          patient:users(*),
          review:appointment_reviews(*)
          ''',
        )
        .eq('patient_id', id)
        .eq('status', status.value)
        .order('created_at', ascending: false)
        .range(from, to);
    return response.map((json) => AppointmentModel.fromJson(json)).toList();
  }

  @override
  Future<AppointmentModel> createAppointmentReview(
    CreateAppointmentReviewRequest request,
  ) async {
    final response = await _supabaseClient.rpc(
      SupabaseConstants.submitAppointmentReviewProcedure,
      params: request.toRpcParams(),
    );
    return AppointmentModel.fromJson(response);
  }
}
