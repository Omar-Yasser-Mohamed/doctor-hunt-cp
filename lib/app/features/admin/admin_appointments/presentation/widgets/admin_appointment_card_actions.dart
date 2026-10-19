part of 'admin_appointment_card.dart';

class _AdminAppointmentCardActions extends StatelessWidget {
  const _AdminAppointmentCardActions({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    switch (appointment.status) {
      case AppointmentStatus.upcoming:
        return _AdminAppointmentCardUpcomingActions(
          appointmentId: appointment.id,
        );
      case AppointmentStatus.completed:
      case AppointmentStatus.cancelled:
        return AppointmentViewDetailsButton(appointmentId: appointment.id);
    }
  }
}

class _AdminAppointmentCardUpcomingActions extends StatelessWidget {
  const _AdminAppointmentCardUpcomingActions({required this.appointmentId});
  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AdminAppointmentsBloc, AdminAppointmentsState>(
            builder: (context, state) {
              return CancelAppointmentButton(
                appointmentId: appointmentId,
                isLoading: state is AdminAppointmentsActionLoading,
                onCancel: () {
                  context.read<AdminAppointmentsBloc>().add(
                    AdminCancelAppointmentEvent(appointmentId: appointmentId),
                  );
                },
              );
            },
          ),
        ),

        8.width,

        const Expanded(child: MarkAsCompletedButton()),
      ],
    );
  }
}
