import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/controller/admin_appointments_bloc/admin_appointments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAppointmentsHeaderTabs extends SliverPersistentHeaderDelegate {
  const AdminAppointmentsHeaderTabs();

  @override
  double get minExtent => 38.h + 12;
  @override
  double get maxExtent => 38.h + 12;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.adminBackground,
      padding: EdgeInsets.only(
        top: 4,
        left: 20.w,
        right: 20.w,
        bottom: 8,
      ),
      child: SizedBox(
        height: 38.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: AppointmentStatus.values.map(
            (status) {
              return Expanded(
                child: _StatusTab(status: status),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(
    covariant AdminAppointmentsHeaderTabs oldDelegate,
  ) {
    return false;
  }
}

class _StatusTab extends StatelessWidget {
  const _StatusTab({
    required this.status,
  });
  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AdminAppointmentsBloc>();
    return BlocSelector<
      AdminAppointmentsBloc,
      AdminAppointmentsState,
      bool
    >(
      selector: (state) => status == bloc.status,
      builder: (context, isSelected) {
        return GestureDetector(
          onTap: () {
            bloc.add(ChangeAppointmentStatusEvent(status: status));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: isSelected ? AppColors.primary : AppColors.activeLight,
            ),
            child: Text(
              status.title,
              style: context.medium12.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
