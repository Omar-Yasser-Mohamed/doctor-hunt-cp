import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/appointment_slot.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/book_appointment.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/repos/patient_booking_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/service/appointment_slots_generator.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'patient_booking_event.dart';
part 'patient_booking_state.dart';

@injectable
class PatientBookingBloc
    extends Bloc<PatientBookingEvent, PatientBookingState> {
  final PatientBookingRepo _patientBookingRepo;
  final AppointmentSlotsGenerator _appointmentSlotsGenerator;

  PatientBookingBloc(
    this._patientBookingRepo,
    this._appointmentSlotsGenerator,
  ) : super(PatientBookingInitial()) {
    on<GetDoctorAvailabilityAndAppointments>(_getAppointmentData);
    on<GetDoctorAppointmentsRequested>(
      _getDoctorAppointments,
      transformer: restartable(),
    );
    on<SelectAppointmentSlot>(_onSelectAppointmentSlot);
    on<BookAppointmentEvent>(_bookAppointment);
  }

  AppointmentSlot? _selectedSlot;
  DateTime _selectedDate = DateTime.now();
  DoctorAvailabilityModel? _doctorAvailabilityModel;
  List<AppointmentModel> _doctorAppointments = [];
  late String _doctorId;
  final List<AppointmentSlot> _appointmentSlots = [];

  AppointmentSlot? get selectedSlot => _selectedSlot;
  DateTime get selectedDate => _selectedDate;
  DoctorAvailabilityModel? get doctorAvailabilityModel =>
      _doctorAvailabilityModel;
  List<AppointmentModel> get doctorAppointments => _doctorAppointments;
  List<AppointmentSlot> get appointmentSlots => _appointmentSlots;

  Future<void> _getAppointmentData(
    GetDoctorAvailabilityAndAppointments event,
    Emitter<PatientBookingState> emit,
  ) async {
    _doctorId = event.doctorId;
    _appointmentSlots.clear();
    emit(GetBookingDataLoading());

    final result = await Future.wait([
      _patientBookingRepo.getDoctorAvailability(doctorId: _doctorId),
      _patientBookingRepo.getDoctorAppointments(
        doctorId: _doctorId,
        date: _selectedDate,
      ),
    ]);

    Failure? failure;

    final doctorAvailabilityResult =
        result[0] as Either<Failure, DoctorAvailabilityModel>;
    final doctorAppointmentsResult =
        result[1] as Either<Failure, List<AppointmentModel>>;

    doctorAvailabilityResult.fold(
      (f) => failure = f,
      (success) => _doctorAvailabilityModel = success,
    );

    if (failure != null) {
      emit(GetBookingDataFailure(failure: failure!));
      return;
    }

    doctorAppointmentsResult.fold(
      (f) => failure = f,
      (success) => _doctorAppointments = success,
    );

    if (failure != null) {
      emit(GetBookingDataFailure(failure: failure!));
    } else {
      _appointmentSlots.addAll(
        _appointmentSlotsGenerator.generateSlots(
          availability: _doctorAvailabilityModel!,
          appointments: _doctorAppointments,
          date: _selectedDate,
        ),
      );
      emit(GetBookingDataSuccess(appointmentSlots: _appointmentSlots));
    }
  }

  Future<void> _getDoctorAppointments(
    GetDoctorAppointmentsRequested event,
    Emitter<PatientBookingState> emit,
  ) async {
    _appointmentSlots.clear();
    _selectedSlot = null;
    _selectedDate = event.date;
    emit(GetAppointmentSlotsLoading());

    final result = await _patientBookingRepo.getDoctorAppointments(
      doctorId: _doctorId,
      date: event.date,
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        emit(GetAppointmentSlotsFailure(failure: failure));
      },
      (appointments) {
        _doctorAppointments = appointments;

        _appointmentSlots.addAll(
          _appointmentSlotsGenerator.generateSlots(
            availability: _doctorAvailabilityModel!,
            appointments: appointments,
            date: event.date,
          ),
        );

        emit(
          GetBookingDataSuccess(appointmentSlots: _appointmentSlots),
        );
      },
    );
  }

  void _onSelectAppointmentSlot(
    SelectAppointmentSlot event,
    Emitter<PatientBookingState> emit,
  ) {
    _selectedSlot = event.slot;
    emit(ChangeSelectedAppointmentSlot(slot: event.slot));
  }

  Future<void> _bookAppointment(
    BookAppointmentEvent event,
    Emitter<PatientBookingState> emit,
  ) async {
    final slot = _selectedSlot;
    if (slot == null) {
      emit(
        BookAppointmentFailure(
          failure: AppFailure(
            message: t.pleaseSelectAnAppointmentSlot,
            code: FailureCode.badRequest,
          ),
        ),
      );
      return;
    }

    emit(BookAppointmentLoading());

    final result = await _patientBookingRepo.bookAppointment(
      BookAppointment(
        appointmentAt: _selectedSlot!,
        doctorId: _doctorId,
      ),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        emit(BookAppointmentFailure(failure: failure));
      },
      (success) {
        emit(BookAppointmentSuccess(slot: _selectedSlot!));
      },
    );
  }
}
