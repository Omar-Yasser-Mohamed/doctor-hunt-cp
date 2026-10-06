import 'package:doctor_hunt/app/features/admin/admin_doctor_details/data/repos/admin_doctor_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'admin_doctor_details_event.dart';
part 'admin_doctor_details_state.dart';

@injectable
class AdminDoctorDetailsBloc
    extends Bloc<AdminDoctorDetailsEvent, AdminDoctorDetailsState> {
  final AdminDoctorDetailsRepo _adminDoctorDetailsRepo;

  AdminDoctorDetailsBloc(this._adminDoctorDetailsRepo)
    : super(AdminDoctorDetailsInitial()) {
    on<GetDoctorDetailsEvent>(_onGetDoctorDetails);
  }

  Future<void> _onGetDoctorDetails(
    GetDoctorDetailsEvent event,
    Emitter<AdminDoctorDetailsState> emit,
  ) async {
    emit(AdminDoctorDetailsLoading());

    final result = await _adminDoctorDetailsRepo.getDoctorDetails(
      doctorId: event.doctorId,
    );

    result.fold(
      (failure) => emit(AdminDoctorDetailsFailure(failure: failure)),
      (doctor) => emit(AdminDoctorDetailsSuccess(doctor: doctor)),
    );
  }
}
