import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsFiltersList extends StatefulWidget {
  const AdminDoctorsFiltersList({super.key});

  @override
  State<AdminDoctorsFiltersList> createState() =>
      _AdminDoctorsFiltersListState();
}

class _AdminDoctorsFiltersListState extends State<AdminDoctorsFiltersList> {
  DoctorSpecialty? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 12.w),
      itemCount: DoctorSpecialty.values.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _FilterChip(
            isSelected: selectedFilter == null,
            filter: null,
            count: 5,
            onTap: () {
              setState(() {
                selectedFilter = null;
              });
            },
          );
        }
        return _FilterChip(
          isSelected: selectedFilter == DoctorSpecialty.values[index - 1],
          filter: DoctorSpecialty.values[index - 1],
          count: 12,
          onTap: () {
            setState(() {
              selectedFilter = DoctorSpecialty.values[index - 1];
            });
          },
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.isSelected,
    required this.filter,
    required this.onTap,
    required this.count,
  });
  final bool isSelected;
  final DoctorSpecialty? filter;
  final VoidCallback onTap;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
  }
}
