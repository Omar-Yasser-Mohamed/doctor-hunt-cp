import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/update_doctor_request.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DoctorManagementService {
  Future<DoctorModel> createDoctor(CreateDoctorRequest request);

  Future<DoctorModel> updateDoctor(UpdateDoctorRequest request);

  Future<void> deleteDoctor(String doctorId);
}

@LazySingleton(as: DoctorManagementService)
final class DoctorManagementServiceImpl implements DoctorManagementService {
  DoctorManagementServiceImpl(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  @override
  Future<DoctorModel> createDoctor(
    CreateDoctorRequest request,
  ) async {
    final response = await _supabaseClient.functions.invoke(
      SupabaseConstants.createDoctorEdgeFunction,
      body: {
        'name': request.name,
        'specialty': request.specialty.name,
        'fees': request.fees.toString(),
      },
      files: request.photo == null
          ? null
          : [
              await MultipartFile.fromPath(
                'photo',
                request.photo!.path,
              ),
            ],
    );

    final data = Map<String, dynamic>.from(response.data);

    return DoctorModel.fromJson(
      Map<String, dynamic>.from(data['doctor']),
    );
  }

  @override
  Future<DoctorModel> updateDoctor(
    UpdateDoctorRequest request,
  ) async {
    final Map<String, dynamic> body = {'doctor_id': request.id};
    if (request.name != null) body['name'] = request.name;
    if (request.specialty != null) body['specialty'] = request.specialty!.name;
    if (request.fees != null) body['fees'] = request.fees;
    if (request.isActive != null) body['is_active'] = request.isActive;

    final response = await _supabaseClient.functions.invoke(
      SupabaseConstants.updateDoctorEdgeFunction,
      body: body,
      files: request.photo == null
          ? null
          : [
              await MultipartFile.fromPath(
                'photo',
                request.photo!.path,
              ),
            ],
    );

    final data = Map<String, dynamic>.from(response.data);

    return DoctorModel.fromJson(
      Map<String, dynamic>.from(data['doctor']),
    );
  }

  @override
  Future<void> deleteDoctor(
    String doctorId,
  ) async {
    await _supabaseClient.functions.invoke(
      SupabaseConstants.deleteDoctorEdgeFunction,
      body: {
        'doctor_id': doctorId,
      },
    );
  }
}
