import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/controller/patient_booking_bloc/patient_booking_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/no_slots_available_widget.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/patient_appointment_available_slots_grid.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/patient_booking_appointment_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentAvailableSlotsBlocBuilder extends StatelessWidget {
  const AppointmentAvailableSlotsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBookingBloc, PatientBookingState>(
      builder: (context, state) {
        if (state is GetBookingDataSuccess ||
            state is BookAppointmentSuccess ||
            state is BookAppointmentLoading ||
            state is BookAppointmentFailure ||
            state is ChangeSelectedAppointmentSlot) {
          final bloc = context.read<PatientBookingBloc>();
          if (bloc.appointmentSlots.isEmpty) {
            return const NoSlotsAvailableWidget();
          }
          return PatientAppointmentAvailableSlotsGrid(
            appointmentSlots: bloc.appointmentSlots,
          );
        }
        if (state is GetAppointmentSlotsFailure) {
          return AppErrorSliver(
            failure: state.failure,
          );
        }
        return const AppointmentAvailableSlotsGridSliverShimmer();
      },
    );
  }
}
