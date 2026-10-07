import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/models/update_doctor_availability.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AdminDoctorAvailabilityService {
  Future<DoctorAvailabilityModel> getDoctorAvailability(String doctorId);

  Future<DoctorAvailabilityModel> updateDoctorAvailability({
    required String doctorId,
    required UpdateDoctorAvailabilityRequest request,
  });
}

@LazySingleton(as: AdminDoctorAvailabilityService)
class AdminDoctorAvailabilityServiceImpl
    implements AdminDoctorAvailabilityService {
  const AdminDoctorAvailabilityServiceImpl(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  @override
  Future<DoctorAvailabilityModel> getDoctorAvailability(
    String doctorId,
  ) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.doctorAvailabilityTable)
        .select()
        .eq('doctor_id', doctorId)
        .single();

    return DoctorAvailabilityModel.fromJson(response);
  }

  @override
  Future<DoctorAvailabilityModel> updateDoctorAvailability({
    required String doctorId,
    required UpdateDoctorAvailabilityRequest request,
  }) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.doctorAvailabilityTable)
        .update(request.toJson())
        .eq('doctor_id', doctorId)
        .select()
        .single();

    return DoctorAvailabilityModel.fromJson(response);
  }
}
