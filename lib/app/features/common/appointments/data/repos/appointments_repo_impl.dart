import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/appointments/data/repos/appointments_repo.dart';
import 'package:doctor_hunt/app/features/common/appointments/data/service/appointments_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppointmentsRepo)
class AppointmentsRepoImpl implements AppointmentsRepo {
  AppointmentsRepoImpl(this._service);
  final AppointmentsService _service;

  @override
  Future<Either<Failure, AppointmentModel>> getAppointmentDetails(
    String appointmentId,
  ) async {
    try {
      final result = await _service.getAppointmentDetails(appointmentId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment(String appointmentId) async {
    try {
      await _service.cancelAppointment(appointmentId);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> markAppointmentAsCompleted(
    String appointmentId,
  ) async {
    try {
      await _service.markAppointmentAsCompleted(appointmentId);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
