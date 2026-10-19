import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/controller/appointment_details_bloc/appointment_details_bloc.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/cancel_appointment_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/mark_as_completed_button.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppointmentDetailsActions extends StatelessWidget {
  const AppointmentDetailsActions({
    super.key,
    required this.appointment,
  });

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<UserBloc>().user?.isAdmin ?? false;
    if (appointment.status != AppointmentStatus.upcoming) {
      return const SizedBox.shrink();
    }

    return BlocConsumer<AppointmentDetailsBloc, AppointmentDetailsState>(
      listener: (context, state) {
        if (state is AppointmentCanceledSuccess) {
          AppToasts.showSuccess(context, t.appointmentCanceledSuccess);
          context.pop();
          context.pop();
        } else if (state is AppointmentCompletedSuccess) {
          AppToasts.showSuccess(context, t.appointmentCompletedSuccess);
          context.pop();
          context.pop();
        } else if (state is AppointmentDetailsActionFailure) {
          AppToasts.showError(context, state.failure.message);
          context.pop();
        }
      },
      builder: (context, state) {
        final bloc = context.read<AppointmentDetailsBloc>();
        return Row(
          spacing: 10,
          children: [
            Expanded(
              child: CancelAppointmentButton(
                appointmentId: appointment.id,
                isLoading: state is AppointmentDetailsActionLoading,
                onCancel: () {
                  bloc.add(
                    CancelAppointmentFromDetailsEvent(
                      appointmentId: appointment.id,
                    ),
                  );
                },
              ),
            ),

            if (isAdmin)
              Expanded(
                child: MarkAsCompletedButton(
                  appointmentId: appointment.id,
                  isLoading: state is AppointmentDetailsActionLoading,
                  showIcon: true,
                  onMarkCompleted: () {
                    bloc.add(
                      CompleteAppointmentFromDetailsEvent(
                        appointmentId: appointment.id,
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
