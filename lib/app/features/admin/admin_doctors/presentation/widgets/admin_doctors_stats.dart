import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorsStats extends StatelessWidget {
  const AdminDoctorsStats({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorsStats = context.watch<AdminDoctorsBloc>().stats;
    return Row(
      children: [
        Expanded(
          child: _StatsCard(
            title: t.activeDoctors,
            value: doctorsStats.activeDoctors.toString(),
          ),
        ),

        12.width,

        Expanded(
          child: _StatsCard(
            title: t.totalDoctors,
            value: doctorsStats.totalDoctors.toString(),
          ),
        ),
      ],
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.regular11TextPlaceholder,
          ),

          4.height,

          Text(
            value,
            style: context.bold18TextMain,
          ),
        ],
      ),
    );
  }
}
