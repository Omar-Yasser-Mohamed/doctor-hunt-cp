import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/controller/patient_booking_bloc/patient_booking_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/booking_appointment_success_dialog.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingAppointmentConfirmationButton extends StatelessWidget {
  const BookingAppointmentConfirmationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientBookingBloc, PatientBookingState>(
      listener: (context, state) {
        if (state is BookAppointmentSuccess) {
          final doctor = context.extra<DoctorModel>();
          BookingAppointmentSuccessDialog.show(
            context,
            doctorName: doctor.name,
            appointmentSlot: state.slot,
          );
        } else if (state is BookAppointmentFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final bloc = context.read<PatientBookingBloc>();
        if (state is GetBookingDataSuccess ||
            state is BookAppointmentSuccess ||
            state is BookAppointmentLoading ||
            state is BookAppointmentFailure ||
            state is ChangeSelectedAppointmentSlot) {
          if (bloc.appointmentSlots.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: EdgeInsets.only(
              top: 24,
              bottom: context.bottomPadding + 24,
              left: 20.w,
              right: 20.w,
            ),
            child: AppButton(
              isLoading: state is BookAppointmentLoading,
              isDisabled: bloc.selectedSlot == null,
              text: t.confirm,
              onPressed: () {
                if (bloc.selectedSlot != null) {
                  bloc.add(const BookAppointmentEvent());
                }
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
