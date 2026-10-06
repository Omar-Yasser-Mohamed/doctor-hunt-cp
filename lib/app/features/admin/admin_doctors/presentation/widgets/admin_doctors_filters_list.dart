import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsFiltersList extends StatelessWidget {
  const AdminDoctorsFiltersList({super.key, required this.specialtyCounts});
  final Map<String, int> specialtyCounts;

  @override
  Widget build(BuildContext context) {
    final totalDoctors = context
        .read<AdminDoctorsBloc>()
        .stats.totalDoctors;

    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 12.w),
      itemCount: DoctorSpecialty.values.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _FilterChip(filter: null, count: totalDoctors);
        }
        return _FilterChip(
          filter: DoctorSpecialty.values[index - 1],
          count: specialtyCounts[DoctorSpecialty.values[index - 1].name] ?? 0,
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.filter, required this.count});
  final DoctorSpecialty? filter;
  final int count;

  @override
  Widget build(BuildContext context) {
    final doctorBloc = context.read<AdminDoctorsBloc>();
    return BlocSelector<AdminDoctorsBloc, AdminDoctorsState, bool>(
      selector: (state) {
        return doctorBloc.specialty == filter;
      },
      builder: (context, isSelected) {
        return GestureDetector(
          onTap: () {
            doctorBloc.add(ChangeSpecialtyEvent(specialty: filter));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: EdgeInsetsDirectional.only(end: 8.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Text(
              "${filter?.title ?? t.all} ($count)",
              style: isSelected
                  ? context.bold12White
                  : context.regular12TextPlaceholder,
            ),
          ),
        );
      },
    );
  }
}
