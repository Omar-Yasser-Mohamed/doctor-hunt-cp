import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/controller/bloc/admin_doctor_details_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/widgets/admin_doctor_details_screen_body.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/widgets/admin_doctor_details_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorDetailsScreen extends StatelessWidget {
  const AdminDoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.doctorDetails,
          style: context.bold18TextMain,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AdminDoctorDetailsBloc, AdminDoctorDetailsState>(
        builder: (context, state) {
          if (state is AdminDoctorDetailsSuccess) {
            return AdminDoctorDetailsScreenBody(doctor: state.doctor);
          } else if (state is AdminDoctorDetailsFailure) {
            return AppErrorWidget.fromFailure(
              failure: state.failure,
              onRetry: () {
                final doctorId = context.extra<String>();
                context.read<AdminDoctorDetailsBloc>().add(
                  GetDoctorDetailsEvent(doctorId: doctorId),
                );
              },
            );
          }
          return const AdminDoctorDetailsShimmer();
        },
      ),
    );
  }
}
