import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_screen_body.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorAvailabilityScreen extends StatelessWidget {
  const AdminDoctorAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: Text(
          t.doctorAvailability,
          style: context.bold18TextMain,
        ),
      ),
      body: BlocBuilder<DoctorAvailabilityBloc, DoctorAvailabilityState>(
        builder: (context, state) {
          if (state is GetDoctorAvailabilitySuccess ||
              state is DoctorAvailabilityEditing ||
              state is SaveDoctorAvailabilityFailure ||
              state is SaveDoctorAvailabilityLoading ||
              state is SaveDoctorAvailabilitySuccess) {
            return const AdminDoctorAvailabilityScreenBody();
          } else if (state is GetDoctorAvailabilityFailure) {
            return AppErrorWidget(
              message: state.failure.message,
              onRetry: () {
                final doctor = context.extra<DoctorModel>();
                context.read<DoctorAvailabilityBloc>().add(
                  GetDoctorAvailabilityEvent(doctor.id),
                );
              },
            );
          }
          return const AdminDoctorAvailabilityShimmer();
        },
      ),
    );
  }
}
