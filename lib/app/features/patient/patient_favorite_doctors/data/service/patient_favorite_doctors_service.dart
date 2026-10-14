import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientFavoriteDoctorsService {
  Future<List<DoctorModel>> getMyFavoriteDoctors();
  Future<void> toggleDoctorInFavorites({
    required String doctorId,
    required bool isFavorite,
  });
}

@LazySingleton(as: PatientFavoriteDoctorsService)
class PatientFavoriteDoctorsServiceImpl
    implements PatientFavoriteDoctorsService {
  const PatientFavoriteDoctorsServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<List<DoctorModel>> getMyFavoriteDoctors() async {
    final userId = _supabaseClient.auth.currentUser!.id;

    final response = await _supabaseClient
        .from(SupabaseConstants.favoritesTable)
        .select('doctors(*)')
        .eq('patient_id', userId);

    return response.map((e) => DoctorModel.fromJson(e['doctors'])).toList();
  }

  @override
  Future<void> toggleDoctorInFavorites({
    required String doctorId,
    required bool isFavorite,
  }) async {
    final userId = _supabaseClient.auth.currentUser!.id;

    if (isFavorite) {
      await _supabaseClient
          .from(SupabaseConstants.favoritesTable)
          .delete()
          .eq('patient_id', userId)
          .eq('doctor_id', doctorId);
    } else {
      await _supabaseClient.from(SupabaseConstants.favoritesTable).insert({
        'patient_id': userId,
        'doctor_id': doctorId,
      });
    }
  }
}
