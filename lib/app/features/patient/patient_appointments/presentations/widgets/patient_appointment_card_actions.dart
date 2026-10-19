part of 'patient_appointment_card.dart';

class _PatientAppointmentCardActions extends StatelessWidget {
  const _PatientAppointmentCardActions({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    switch (appointment.status) {
      case AppointmentStatus.upcoming:
        return _PatientAppointmentCardUpcomingActions(appointment: appointment);
      case AppointmentStatus.completed:
        return _PatientAppointmentCardCompletedActions(
          appointment: appointment,
        );
      case AppointmentStatus.cancelled:
        return AppointmentViewDetailsButton(appointmentId: appointment.id);
    }
  }
}

class _PatientAppointmentCardUpcomingActions extends StatelessWidget {
  const _PatientAppointmentCardUpcomingActions({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppointmentViewDetailsButton(appointmentId: appointment.id),
        ),

        8.width,

        Expanded(
          child: BlocBuilder<PatientAppointmentsBloc, PatientAppointmentsState>(
            builder: (context, state) {
              return CancelAppointmentButton(
                appointmentId: appointment.id,
                isLoading: state is PatientAppointmentsActionLoading,
                onCancel: () {
                  context.read<PatientAppointmentsBloc>().add(
                    PatientCancelAppointmentEvent(
                      appointmentId: appointment.id,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PatientAppointmentCardCompletedActions extends StatelessWidget {
  const _PatientAppointmentCardCompletedActions({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppointmentViewDetailsButton(appointmentId: appointment.id),
        ),
        8.width,
        const Expanded(child: _RateDoctorButton()),
      ],
    );
  }
}

class _RateDoctorButton extends StatelessWidget {
  const _RateDoctorButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 36.h,
      radius: 6.r,
      textStyle: context.medium11White,
      text: t.rateDoctor,
      onPressed: () {},
    );
  }
}
