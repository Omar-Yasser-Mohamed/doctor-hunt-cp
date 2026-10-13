import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/models/update_patient_profile.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PatientProfileService {
  Future<CurrentUserModel> updatePatientProfile(
    UpdatePatientProfile request,
  );
}

@LazySingleton(as: PatientProfileService)
class PatientProfileServiceImpl implements PatientProfileService {
  PatientProfileServiceImpl(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  @override
  Future<CurrentUserModel> updatePatientProfile(
    UpdatePatientProfile request,
  ) async {
    final formData = <String, String>{};

    final name = request.name?.trim();
    if (name != null && name.isNotEmpty) {
      formData['name'] = name;
    }

    final response = await _supabaseClient.functions.invoke(
      SupabaseConstants.updatePatientProfileEdgeFunction,
      body: formData.isEmpty ? null : formData,
      files: request.image == null
          ? null
          : [
              await MultipartFile.fromPath(
                'image',
                request.image!.path,
              ),
            ],
    );
    final profile = Map<String, dynamic>.from(response.data['profile'] as Map);
    final user = UserModel.fromJson(profile);
    return CurrentUserModel(user: user, admin: null);
  }
}
