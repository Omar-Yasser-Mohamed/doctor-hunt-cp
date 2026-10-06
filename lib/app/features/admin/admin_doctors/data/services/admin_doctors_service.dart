import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/models/doctors_stats.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AdminDoctorsService {
  Future<DoctorsStats> getDoctorStats();

  Future<Map<String, int>> getSpecialtyCounts();

  Future<List<DoctorModel>> getDoctors({
    String? search,
    DoctorSpecialty? specialty,
    required int page,
    int limit = 10,
  });
}

@LazySingleton(as: AdminDoctorsService)
class AdminDoctorsServiceImpl implements AdminDoctorsService {
  const AdminDoctorsServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<DoctorsStats> getDoctorStats() async {
    final adminId = _supabaseClient.auth.currentUser!.id;

    final response = await _supabaseClient.rpc(
      SupabaseConstants.getDoctorStatsProcedure,
      params: {
        'p_admin_id': adminId,
      },
    );

    return DoctorsStats.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  @override
  Future<Map<String, int>> getSpecialtyCounts() async {
    final adminId = _supabaseClient.auth.currentUser!.id;

    final response = await _supabaseClient.rpc(
      SupabaseConstants.getDoctorSpecialtyCountsProcedure,
      params: {
        'p_admin_id': adminId,
      },
    );

    return {
      for (final item in response)
        item['specialty'] as String: (item['count'] as num).toInt(),
    };
  }

  @override
  Future<List<DoctorModel>> getDoctors({
    String? search,
    DoctorSpecialty? specialty,
    required int page,
    int limit = 10,
  }) async {
    final adminId = _supabaseClient.auth.currentUser!.id;

    var query = _supabaseClient
        .from(SupabaseConstants.doctorsTable)
        .select()
        .eq('admin_id', adminId);

    if (search != null && search.trim().isNotEmpty) {
      query = query.ilike(
        'name',
        '%${search.trim()}%',
      );
    }

    if (specialty != null) {
      query = query.eq(
        'specialty',
        specialty.name,
      );
    }

    final from = (page - 1) * limit;
    final to = from + limit - 1;

    final response = await query
        .order('created_at', ascending: false)
        .range(from, to);

    return response
        .map(
          (json) => DoctorModel.fromJson(
            Map<String, dynamic>.from(json),
          ),
        )
        .toList();
  }
}
