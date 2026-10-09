import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/data/repos/patient_doctor_details_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'patient_doctor_details_event.dart';
part 'patient_doctor_details_state.dart';

@injectable
class PatientDoctorDetailsBloc
    extends Bloc<PatientDoctorDetailsEvent, PatientDoctorDetailsState> {
  PatientDoctorDetailsBloc(
    this._patientDoctorDetailsRepo,
  ) : super(PatientDoctorDetailsInitial()) {
    on<GetPatientDoctorDetailsEvent>(_onGetDoctorDetails);
  }

  final PatientDoctorDetailsRepo _patientDoctorDetailsRepo;

  Future<void> _onGetDoctorDetails(
    GetPatientDoctorDetailsEvent event,
    Emitter<PatientDoctorDetailsState> emit,
  ) async {
    emit(PatientDoctorDetailsLoading());

    final result = await _patientDoctorDetailsRepo.getDoctorDetails(
      doctorId: event.doctorId,
    );

    result.fold(
      (failure) => emit(PatientDoctorDetailsFailure(failure: failure)),
      (doctor) => emit(PatientDoctorDetailsSuccess(doctor: doctor)),
    );
  }
}
