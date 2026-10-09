import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/doctors_empty_state.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_doctors_list_bloc/patient_doctors_list_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/patient_doctors_list_app_bar.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/patient_doctors_list_view.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/patient_doctors_list_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientDoctorsListScreen extends StatelessWidget {
  const PatientDoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PatientDoctorsListAppBar(),
      child: BlocConsumer<PatientDoctorsListBloc, PatientDoctorsListState>(
        listener: (context, state) {
          if (state is PatientDoctorsListPaginationFailure) {
            AppToasts.showError(context, state.failure.message);
          }
        },
        builder: (context, state) {
          final bloc = context.read<PatientDoctorsListBloc>();
          if (state is PatientDoctorsListSuccess ||
              state is PatientDoctorsListPaginationFailure ||
              state is PatientDoctorsListPaginationLoading) {
            if (bloc.doctors.isEmpty) {
              return DoctorsEmptyState(
                iconSvg: AppIcons.medical,
                title: t.noDoctorsFound,
                description: t.noDoctorsSearchDescription,
              );
            }
            return PatientDoctorsListView(doctors: bloc.doctors);
          } else if (state is PatientDoctorsListFailure) {
            return AppErrorWidget(
              failure: state.failure,
              onRetry: () {
                final doctorsFilter = context.extra<DoctorsFilter>();
                bloc.add(GetDoctorsList(doctorsFilter: doctorsFilter));
              },
            );
          }
          return const PatientDoctorsListShimmer();
        },
      ),
    );
  }
}
