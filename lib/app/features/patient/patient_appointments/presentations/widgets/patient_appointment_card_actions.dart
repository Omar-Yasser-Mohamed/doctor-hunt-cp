part of 'patient_appointment_card.dart';

class _PatientAppointmentCardActions extends StatelessWidget {
  const _PatientAppointmentCardActions({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    switch (appointment.status) {
      case AppointmentStatus.upcoming:
        return const _PatientAppointmentCardUpcomingActions();
      case AppointmentStatus.completed:
        return const _PatientAppointmentCardCompletedActions();
      case AppointmentStatus.cancelled:
        return const AppointmentViewDetailsButton();
    }
  }
}

class AppointmentViewDetailsButton extends StatelessWidget {
  const AppointmentViewDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      height: 36.h,
      radius: 6.r,
      textStyle: context.medium11Primary,
      text: t.viewDetails,
      onPressed: () {},
    );
  }
}

class _PatientAppointmentCardUpcomingActions extends StatelessWidget {
  const _PatientAppointmentCardUpcomingActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppointmentViewDetailsButton()),
        8.width,
        const Expanded(child: CancelAppointmentButton()),
      ],
    );
  }
}

class _PatientAppointmentCardCompletedActions extends StatelessWidget {
  const _PatientAppointmentCardCompletedActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppointmentViewDetailsButton()),
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
