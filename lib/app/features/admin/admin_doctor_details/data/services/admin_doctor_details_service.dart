import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AdminDoctorDetailsService {
  Future<DoctorModel> getDoctorDetails({required String doctorId});
}

@LazySingleton(as: AdminDoctorDetailsService)
class AdminDoctorDetailsServiceImpl implements AdminDoctorDetailsService {
  AdminDoctorDetailsServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<DoctorModel> getDoctorDetails({required String doctorId}) async {
    final adminId = _supabaseClient.auth.currentUser?.id;
    final response = await _supabaseClient
        .from(SupabaseConstants.doctorsTable)
        .select('*, admins (*)')
        .eq('id', doctorId)
        .single();
    return DoctorModel.fromJson(response);
  }
}
