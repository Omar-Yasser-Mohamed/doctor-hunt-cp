import 'dart:io';

import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/services/image_picker_service.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/models/update_patient_profile.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/repos/patient_profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'patient_update_profile_event.dart';
part 'patient_update_profile_state.dart';

@injectable
class PatientUpdateProfileBloc
    extends Bloc<PatientUpdateProfileEvent, PatientUpdateProfileState> {
  final PatientProfileRepo _repo;
  final ImagePickerService _imagePickerService;
  PatientUpdateProfileBloc(this._repo, this._imagePickerService)
    : super(PatientUpdateProfileInitial()) {
    on<UpdatePatientProfileInitialized>(_onPatientUpdateProfileInitialized);
    on<UpdatePatientProfileEvent>(_onPatientUpdateProfile);
    on<UpdatePatientProfileChangeImage>(_onPatientUpdateProfileImage);
    on<UpdatePatientProfileNameChanged>(_onPatientUpdateProfileNameChanged);
  }

  CurrentUserModel? _currentUser;
  String? _currentName;
  File? _profileImage;

  CurrentUserModel? get currentUser => _currentUser;
  File? get pickedImage => _profileImage;
  String? get currentName => _currentName;

  bool get isFormDirty {
    final initialName = _currentUser?.user.name;
    final bool nameChanged = (_currentName ?? '').trim() != (initialName ?? '').trim();
    final bool imageChanged = _profileImage != null;
    return nameChanged || imageChanged;
  }

  void _onPatientUpdateProfileNameChanged(
    UpdatePatientProfileNameChanged event,
    Emitter<PatientUpdateProfileState> emit,
  ) {
    _currentName = event.name;
    emit(PatientUpdateProfileFormDirtyChanged(isDirty: isFormDirty));
  }

  void _onPatientUpdateProfileInitialized(
    UpdatePatientProfileInitialized event,
    Emitter<PatientUpdateProfileState> emit,
  ) {
    _currentUser = event.currentUser;
    _currentName = event.currentUser.user.name;
    _profileImage = null;

    emit(PatientUpdateProfileFormDirtyChanged(isDirty: isFormDirty));
  }

  Future<void> _onPatientUpdateProfile(
    UpdatePatientProfileEvent event,
    Emitter<PatientUpdateProfileState> emit,
  ) async {
    emit(PatientUpdateProfileLoading());

    final request = UpdatePatientProfile(
      name: event.name,
      image: _profileImage,
    );

    final result = await _repo.updatePatientProfile(request);
    result.fold(
      (failure) => emit(PatientUpdateProfileFailure(failure)),
      (updateProfile) {
        _currentUser = updateProfile;
        _currentName = updateProfile.user.name;
        _profileImage = null;
        emit(PatientUpdateProfileFormDirtyChanged(isDirty: isFormDirty));
        emit(PatientUpdateProfileSuccess(updateProfile));
      },
    );
  }

  Future<void> _onPatientUpdateProfileImage(
    UpdatePatientProfileChangeImage event,
    Emitter<PatientUpdateProfileState> emit,
  ) async {
    final picked = await _imagePickerService.pickImage(source: event.source);

    picked.fold(
      (failure) {
        emit(PatientUpdateProfileFailure(failure));
      },
      (pickedImage) {
        if (pickedImage != null) {
          _profileImage = File(pickedImage.path);
          emit(PatientUpdateProfileChangeImage(_profileImage!));
          emit(PatientUpdateProfileFormDirtyChanged(isDirty: isFormDirty));
        }
      },
    );
  }
}
