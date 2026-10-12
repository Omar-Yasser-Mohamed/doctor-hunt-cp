import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/admin_model.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/models/update_admin_profile.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AdminProfileService {
  Future<CurrentUserModel> updateAdminProfile(
    UpdateAdminProfileRequest request,
  );
}

@LazySingleton(as: AdminProfileService)
class AdminProfileServiceImpl implements AdminProfileService {
  AdminProfileServiceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<CurrentUserModel> updateAdminProfile(
    UpdateAdminProfileRequest request,
  ) async {
    final formData = <String, String>{};

    final name = request.name?.trim();
    if (name != null && name.isNotEmpty) {
      formData['name'] = name;
    }

    final location = request.location;
    if (location != null) {
      formData
        ..['address'] = location.address
        ..['latitude'] = location.latitude.toString()
        ..['longitude'] = location.longitude.toString();
    }

    final response = await _supabase.functions.invoke(
      SupabaseConstants.updateAdminProfileEdgeFunction,
      body: formData,
      files: request.photo == null
          ? null
          : [
              await MultipartFile.fromPath(
                'image',
                request.photo!.path,
              ),
            ],
    );

    final data = Map<String, dynamic>.from(response.data as Map);
    final profile = Map<String, dynamic>.from(data['profile'] as Map);

    final user = UserModel.fromJson(profile);

    final admin = AdminModel(
      userId: user.id,
      address: profile['address'] as String?,
      latitude: (profile['latitude'] as num?)?.toDouble(),
      longitude: (profile['longitude'] as num?)?.toDouble(),
    );

    return CurrentUserModel(
      user: user,
      admin: admin,
    );
  }
}
