import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/controller/appointment_details_bloc/appointment_details_bloc.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_details_screen_body.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_details_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: Text(
          t.appointmentDetails,
          style: context.bold18TextMain,
        ),
      ),
      body: BlocBuilder<AppointmentDetailsBloc, AppointmentDetailsState>(
        builder: (context, state) {
          final bloc = context.read<AppointmentDetailsBloc>();
          if (state is AppointmentDetailsLoading ||
              state is AppointmentDetailsInitial) {
            return const AppointmentDetailsShimmer();
          } else if (state is AppointmentDetailsFailure) {
            return AppErrorWidget(
              failure: state.failure,
              onRetry: () {
                final appointmentId = context.extra<String>();
                bloc.add(
                  GetAppointmentDetailsEvent(appointmentId: appointmentId),
                );
              },
            );
          }
          return AppointmentDetailsScreenBody(
            appointment: bloc.appointment,
          );
        },
      ),
    );
  }
}
