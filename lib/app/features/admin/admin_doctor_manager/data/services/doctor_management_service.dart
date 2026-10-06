import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/shared/services/supabase_storage_service.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DoctorManagementService {
  Future<DoctorModel> createDoctor(CreateDoctorRequest request);
}

@LazySingleton(as: DoctorManagementService)
final class DoctorManagementServiceImpl implements DoctorManagementService {
  DoctorManagementServiceImpl(
    this._supabaseClient,
    this._supabaseStorageService,
  );
  final SupabaseClient _supabaseClient;
  final SupabaseStorageService _supabaseStorageService;

  @override
  Future<DoctorModel> createDoctor(CreateDoctorRequest request) async {
    final adminId = _supabaseClient.auth.currentUser?.id;
    if (adminId == null) throw const AuthException('User is not authenticated');

    String? uploadedImagePath;
    try {
      if (request.photo != null) {
        uploadedImagePath =
            '$adminId/${DateTime.now().millisecondsSinceEpoch}.jpg';

        await _supabaseStorageService.uploadImage(
          file: request.photo!,
          path: uploadedImagePath,
          bucket: SupabaseConstants.doctorPhotosBucket,
        );
      }

      final response = await _supabaseClient
          .from(SupabaseConstants.doctorsTable)
          .insert(
            request.toJson(adminId: adminId, photoPath: uploadedImagePath),
          )
          .select()
          .single();

      return DoctorModel.fromJson(response);
    } catch (_) {
      if (uploadedImagePath != null) {
        try {
          await _supabaseStorageService.deleteImage(
            path: uploadedImagePath,
            bucket: SupabaseConstants.doctorPhotosBucket,
          );
        } catch (_) {
          // Preserve the original error.
        }
      }

      rethrow;
    }
  }
}
