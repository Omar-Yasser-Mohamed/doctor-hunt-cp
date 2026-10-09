import 'dart:developer';

import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientHomeService {
  Future<List<DoctorModel>> getDoctors({
    required DoctorsFilter filter,
    required int page,
    required int limit,
  });
}

@LazySingleton(as: PatientHomeService)
class PatientHomeServiceImpl implements PatientHomeService {
  const PatientHomeServiceImpl(this.supabaseClient);
  final SupabaseClient supabaseClient;

  @override
  Future<List<DoctorModel>> getDoctors({
    required int page,
    required int limit,
    required DoctorsFilter filter,
  }) async {
    final from = (page - 1) * limit;
    final to = page * limit - 1;

    final response = switch (filter.type) {
      DoctorsListType.popular =>
        await supabaseClient
            .from(SupabaseConstants.doctorsTable)
            .select()
            .eq('is_active', true)
            .order('created_at', ascending: false)
            .range(from, to),

      DoctorsListType.topRated =>
        await supabaseClient
            .from(SupabaseConstants.doctorsTable)
            .select()
            .eq('is_active', true)
            .order('rating', ascending: false)
            .range(from, to),

      DoctorsListType.category =>
        await supabaseClient
            .from(SupabaseConstants.doctorsTable)
            .select()
            .eq('is_active', true)
            .eq('specialty', filter.category!.name)
            .range(from, to),
    };
    log("from ${filter.type.name}");
    log("response: ${response.length}");

    return response
        .map(
          (json) => DoctorModel.fromJson(
            Map<String, dynamic>.from(json),
          ),
        )
        .toList();
  }
}
