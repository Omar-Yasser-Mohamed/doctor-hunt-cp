import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentTimesListView extends StatefulWidget {
  const AppointmentTimesListView({super.key});

  @override
  State<AppointmentTimesListView> createState() =>
      _AppointmentTimesListViewState();
}

class _AppointmentTimesListViewState extends State<AppointmentTimesListView> {
  DateTime? selectedDate;
  int? selectedIndex;

  List<DateTime> get _times {
    return List.generate(7, (index) {
      return DateTime.now().add(Duration(hours: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 12.w),
      scrollDirection: Axis.horizontal,
      itemCount: _times.length,
      itemBuilder: (context, index) {
        return _TimeChip(
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

class _TimeChip extends StatelessWidget {
  const _TimeChip({
    required this.time,
    required this.onTap,
    required this.isSelected,
  });
  final DateTime time;
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
              DateFormat("hh:mm\na").format(time),
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
