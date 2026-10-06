import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/shared/services/supabase_storage_service.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/update_doctor_request.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DoctorManagementService {
  Future<DoctorModel> createDoctor(CreateDoctorRequest request);
  Future<DoctorModel> updateDoctor(UpdateDoctorRequest request);
  Future<void> deleteDoctor(String doctorId);
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

    String? imageUrl;
    try {
      if (request.photo != null) {
        final uploadedImagePath =
            '$adminId/${DateTime.now().millisecondsSinceEpoch}.jpg';

        imageUrl = await _supabaseStorageService.uploadImage(
          file: request.photo!,
          path: uploadedImagePath,
          bucket: SupabaseConstants.doctorPhotosBucket,
        );
      }

      final response = await _supabaseClient
          .from(SupabaseConstants.doctorsTable)
          .insert(
            request.toJson(adminId: adminId, photoPath: imageUrl),
          )
          .select()
          .single();

      return DoctorModel.fromJson(response);
    } catch (_) {
      if (imageUrl != null) {
        try {
          await _supabaseStorageService.deleteImage(
            path: imageUrl,
            bucket: SupabaseConstants.doctorPhotosBucket,
          );
        } catch (_) {
          // Preserve the original error.
        }
      }

      rethrow;
    }
  }

  @override
  Future<DoctorModel> updateDoctor(UpdateDoctorRequest request) async {
    final adminId = _supabaseClient.auth.currentUser?.id;
    if (adminId == null) throw const AuthException('User is not authenticated');

    String? imageUrl;
    try {
      if (request.photo != null) {
        final uploadedImagePath =
            '$adminId/${DateTime.now().millisecondsSinceEpoch}.jpg';

        imageUrl = await _supabaseStorageService.uploadImage(
          file: request.photo!,
          path: uploadedImagePath,
          bucket: SupabaseConstants.doctorPhotosBucket,
        );
      }

      final updateData = request.toUpdateJson(photoPath: imageUrl);
      if (updateData.isEmpty) {
        final response = await _supabaseClient
            .from(SupabaseConstants.doctorsTable)
            .select()
            .eq('id', request.id)
            .single();
        return DoctorModel.fromJson(response);
      }

      final response = await _supabaseClient
          .from(SupabaseConstants.doctorsTable)
          .update(updateData)
          .eq('id', request.id)
          .select()
          .single();

      return DoctorModel.fromJson(response);
    } catch (_) {
      if (imageUrl != null) {
        try {
          await _supabaseStorageService.deleteImage(
            path: imageUrl,
            bucket: SupabaseConstants.doctorPhotosBucket,
          );
        } catch (_) {
          // Preserve the original error.
        }
      }

      rethrow;
    }
  }

  @override
  Future<void> deleteDoctor(String doctorId) async {
    final adminId = _supabaseClient.auth.currentUser?.id;
    if (adminId == null) throw const AuthException('User is not authenticated');

    await _supabaseClient
        .from(SupabaseConstants.doctorsTable)
        .delete()
        .eq('id', doctorId);
  }
}
