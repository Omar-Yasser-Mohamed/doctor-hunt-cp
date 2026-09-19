import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderMeSection extends StatelessWidget {
  const ReminderMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w),
          child: Text(
            t.appointment.reminderMeBefore,
            style: context.medium16TextMain,
          ),
        ),

        24.height,

        SizedBox(
          height: 60.h,
          child: const _ReminderTimesListView(),
        ),
      ],
    );
  }
}

class _ReminderTimesListView extends StatefulWidget {
  const _ReminderTimesListView();

  @override
  State<_ReminderTimesListView> createState() => _ReminderTimesListViewState();
}

class _ReminderTimesListViewState extends State<_ReminderTimesListView> {
  int? selectedIndex;

  final _times = [
    const Duration(minutes: 60),
    const Duration(minutes: 30),
    const Duration(minutes: 15),
    const Duration(minutes: 10),
    const Duration(minutes: 50),
    const Duration(minutes: 45),
    const Duration(minutes: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 12.w),
      scrollDirection: Axis.horizontal,
      itemCount: _times.length,
      itemBuilder: (context, index) {
        return _ReminderTimeChip(
          time: _times[index],
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          isSelected: selectedIndex == index,
        );
      },
    );
  }
}

class _ReminderTimeChip extends StatelessWidget {
  const _ReminderTimeChip({
    required this.time,
    required this.onTap,
    required this.isSelected,
  });
  final Duration time;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 60.w,
        width: 60.w,
        alignment: Alignment.center,
        margin: EdgeInsetsDirectional.only(end: 8.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.lighterGreen.withValues(alpha: .08),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${time.inMinutes}\n${t.appointment.minit}",
              textAlign: TextAlign.center,
              style: context.medium12.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
