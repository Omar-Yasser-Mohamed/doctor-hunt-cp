import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientFindDoctorsService {
  Future<List<DoctorModel>> searchForDoctors({
    required String query,
    int page = 1,
    int limit = 10,
  });
}

@LazySingleton(as: PatientFindDoctorsService)
class PatientFindDoctorsServiceImpl implements PatientFindDoctorsService {
  PatientFindDoctorsServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<List<DoctorModel>> searchForDoctors({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.doctorsTable)
        .select()
        .ilike('name', '%${query.trim()}%')
        .range((page - 1) * limit, page * limit - 1);

    return (response as List<dynamic>)
        .map((json) => DoctorModel.fromJson(json))
        .toList();
  }
}
