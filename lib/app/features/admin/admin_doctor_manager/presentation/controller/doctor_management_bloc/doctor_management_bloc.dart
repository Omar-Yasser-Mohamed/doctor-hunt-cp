import 'dart:io';
import 'package:doctor_hunt/app/core/shared/services/image_picker_service.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/repos/doctor_management_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'doctor_management_event.dart';
part 'doctor_management_state.dart';

@injectable
class DoctorManagementBloc
    extends Bloc<DoctorManagementEvent, DoctorManagementState> {
  final DoctorManagementRepo _doctorManagementRepo;
  final ImagePickerService _imagePickerService;

  DoctorManagementBloc(this._doctorManagementRepo, this._imagePickerService)
    : super(DoctorManagementInitial()) {
    on<PickDoctorProfileImage>(_pickDoctorImage);
    on<RemoveDoctorProfileImage>(_removeDoctorImage);
    on<SelectDoctorSpecialty>(_selectDoctorSpecialty);
    on<CreateDoctor>(_createDoctor);
  }

  File? _doctorImage;
  DoctorSpecialty? _selectedSpecialty;

  File? get doctorImage => _doctorImage;
  DoctorSpecialty? get selectedSpecialty => _selectedSpecialty;

  void _selectDoctorSpecialty(
    SelectDoctorSpecialty event,
    Emitter<DoctorManagementState> emit,
  ) {
    if (_selectedSpecialty == event.specialty) return;

    _selectedSpecialty = event.specialty;
    emit(DoctorManagementInitial());
  }

  Future<void> _pickDoctorImage(
    PickDoctorProfileImage event,
    Emitter<DoctorManagementState> emit,
  ) async {
    final result = await _imagePickerService.pickImage(source: event.source);
    result.fold(
      (failure) => emit(DoctorManagementFailure(failure: failure)),
      (imageFile) {
        _doctorImage = File(imageFile!.path);
        emit(DoctorManagementImagePicked(imageFile: _doctorImage!));
      },
    );
  }

  void _removeDoctorImage(
    RemoveDoctorProfileImage event,
    Emitter<DoctorManagementState> emit,
  ) {
    _doctorImage = null;
    emit(const DoctorManagementImageRemoved());
  }

  Future<void> _createDoctor(
    CreateDoctor event,
    Emitter<DoctorManagementState> emit,
  ) async {
    if (_selectedSpecialty == null) return;

    if (_doctorImage == null) {
      emit(const DoctorManagementImageNotPicked());
      return;
    }

    emit(DoctorManagementLoading());

    final result = await _doctorManagementRepo.createDoctor(
      CreateDoctorRequest(
        name: event.name,
        specialty: _selectedSpecialty!,
        fees: event.fees,
        photo: _doctorImage,
      ),
    );

    result.fold(
      (failure) => emit(DoctorManagementFailure(failure: failure)),
      (doctor) => emit(DoctorManagementSuccess(doctor: doctor)),
    );
  }
}
