import 'dart:io';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/models/update_admin_profile.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/repos/admin_profile_repo.dart';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'admin_edit_profile_event.dart';
part 'admin_edit_profile_state.dart';

@injectable
class AdminEditProfileBloc extends Bloc<AdminEditProfileEvent, AdminEditProfileState> {
  final AdminProfileRepo _adminProfileRepo;
  final ImagePicker _imagePicker;

  AdminEditProfileBloc(
    this._adminProfileRepo,
    this._imagePicker,
  ) : super(const AdminEditProfileInitial()) {
    on<AdminEditProfileInitialized>(_onInitialized);
    on<AdminEditProfileNameChanged>(_onNameChanged);
    on<AdminEditProfilePickImage>(_onPickImage);
    on<AdminEditProfileLocationChanged>(_onLocationChanged);
    on<AdminEditProfileSubmitted>(_onSubmitted);
  }

  CurrentUserModel? _currentUser;
  String? _currentName;
  File? _pickedImage;
  LocationModel? _currentLocation;

  CurrentUserModel? get currentUser => _currentUser;
  File? get pickedImage => _pickedImage;
  LocationModel? get currentLocation => _currentLocation;

  bool get isFormDirty {
    final initialName = _currentUser?.user.name;
    final bool nameChanged = (_currentName ?? '').trim() != (initialName ?? '').trim();
    final bool imageChanged = _pickedImage != null;
    final bool locationChanged = _isLocationChanged();

    return nameChanged || imageChanged || locationChanged;
  }

  bool _isLocationChanged() {
    if (_currentLocation == null) return false;
    final initialAddress = _currentUser?.admin?.address;
    final initialLatitude = _currentUser?.admin?.latitude;
    final initialLongitude = _currentUser?.admin?.longitude;

    final bool addressChanged = _currentLocation!.address.trim() != (initialAddress ?? '').trim();
    final bool latChanged = _currentLocation!.latitude != initialLatitude;
    final bool lngChanged = _currentLocation!.longitude != initialLongitude;
    return addressChanged || latChanged || lngChanged;
  }

  void _onInitialized(
    AdminEditProfileInitialized event,
    Emitter<AdminEditProfileState> emit,
  ) {
    _currentUser = event.currentUser;
    _currentName = event.currentUser.user.name;
    _pickedImage = null;

    final address = event.currentUser.admin?.address;
    final latitude = event.currentUser.admin?.latitude;
    final longitude = event.currentUser.admin?.longitude;

    if (address != null && latitude != null && longitude != null) {
      _currentLocation = LocationModel(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
    } else {
      _currentLocation = null;
    }

    emit(AdminEditProfileFormDirtyChanged(isDirty: isFormDirty));
  }

  void _onNameChanged(
    AdminEditProfileNameChanged event,
    Emitter<AdminEditProfileState> emit,
  ) {
    _currentName = event.name;
    emit(AdminEditProfileFormDirtyChanged(isDirty: isFormDirty));
  }

  Future<void> _onPickImage(
    AdminEditProfilePickImage event,
    Emitter<AdminEditProfileState> emit,
  ) async {
    final XFile? picked = await _imagePicker.pickImage(
      source: event.source,
      imageQuality: 85,
    );

    if (picked != null) {
      _pickedImage = File(picked.path);
      emit(AdminEditProfileImagePicked(_pickedImage!));
      emit(AdminEditProfileFormDirtyChanged(isDirty: isFormDirty));
    }
  }

  void _onLocationChanged(
    AdminEditProfileLocationChanged event,
    Emitter<AdminEditProfileState> emit,
  ) {
    _currentLocation = event.location;
    emit(AdminEditProfileLocationPicked(event.location));
    emit(AdminEditProfileFormDirtyChanged(isDirty: isFormDirty));
  }

  Future<void> _onSubmitted(
    AdminEditProfileSubmitted event,
    Emitter<AdminEditProfileState> emit,
  ) async {
    if (!isFormDirty) return;

    emit(const AdminEditProfileLoading());

    final initialName = _currentUser?.user.name;
    final request = UpdateAdminProfileRequest(
      name: (_currentName ?? '').trim() != (initialName ?? '').trim()
          ? _currentName!.trim()
          : null,
      photo: _pickedImage,
      location: _isLocationChanged() ? _currentLocation : null,
    );

    final result = await _adminProfileRepo.updateAdminProfile(request);

    result.fold(
      (failure) => emit(AdminEditProfileFailure(failure)),
      (updatedUser) {
        _currentUser = updatedUser;
        _pickedImage = null;
        emit(AdminEditProfileSuccess(updatedUser));
      },
    );
  }
}
