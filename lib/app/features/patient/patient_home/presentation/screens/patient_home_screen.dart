import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_home_bloc/patient_home_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/patient_home_screen_body.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/patient_home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      topPos: 100.h,
      bottomPos: 10.h,
      child: BlocConsumer<PatientHomeBloc, PatientHomeState>(
        listener: (context, state) {
          if (state is PatientHomePaginationFailure) {
            AppToasts.showError(context, state.failure.message);
          }
        },
        builder: (context, state) {
          final bloc = context.read<PatientHomeBloc>();
          if (state is PatientHomeSuccess ||
              state is PatientHomePaginationFailure ||
              state is PatientMorePopularLoading ||
              state is PatientMoreTopRatedLoading) {
            return PatientHomeScreenBody(
              popularDoctors: bloc.popularDoctors,
              topRatedDoctors: bloc.topRatedDoctors,
            );
          } else if (state is PatientHomeFailure) {
            return AppErrorWidget(
              failure: state.failure,
              onRetry: () {
                bloc.add(const GetHomeDoctors());
              },
            );
          }
          return const PatientHomeScreenShimmer();
        },
      ),
    );
  }
}
