import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_list_view.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_shimmer.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/no_doctors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsListSection extends StatelessWidget {
  const AdminDoctorsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDoctorsBloc, AdminDoctorsState>(
      listener: (context, state) {
        if (state is AdminDoctorsPaginationFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      builder: (context, state) {
        if (state is AdminDoctorsSuccess ||
            state is AdminDoctorsPaginationFailure ||
            state is AdminDoctorsPaginationLoading) {
          final doctors = context.read<AdminDoctorsBloc>().doctors;
          if (doctors.isEmpty) {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 464.h,
                child: const NoDoctorsWidget(),
              ),
            );
          }

          return SliverPadding(
            padding: EdgeInsets.only(
              top: 22,
              left: 20.w,
              right: 20.w,
              bottom: 12,
            ),
            sliver: AdminDoctorsListView(doctors: doctors),
          );
        } else if (state is AdminDoctorsListLoading) {
          return const AdminDoctorsListSliverShimmer();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
