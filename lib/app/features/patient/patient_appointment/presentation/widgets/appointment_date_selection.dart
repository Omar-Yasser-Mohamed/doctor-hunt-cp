import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDateSelection extends StatefulWidget {
  const AppointmentDateSelection({super.key});

  @override
  State<AppointmentDateSelection> createState() =>
      _AppointmentDateSelectionState();
}

class _AppointmentDateSelectionState extends State<AppointmentDateSelection> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 280.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGray2),
      ),
      child: DatePicker(
        padding: EdgeInsets.zero,
        maxDate: DateTime.now().add(const Duration(days: 365)),
        minDate: DateTime.now(),
        selectedDate: selectedDate,
        onDateSelected: (date) {
          setState(() {
            selectedDate = date;
          });
        },
        theme: DatePickerPlusTheme(
          headerTheme: HeaderTheme(
            headerPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            leadingDateTextStyle: context.medium16White,
            forwardArrowWidget: const Icon(
              Icons.chevron_right,
              color: AppColors.white,
              size: 26,
            ),
            backwardArrowWidget: const Icon(
              Icons.chevron_left,
              color: AppColors.white,
              size: 26,
            ),

            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
          ),

          daysPickerTheme: DaysPickerTheme(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            inkResponseTheme: const InkResponseTheme(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            currentDateTextStyle: context.regular14Black,
            enabledCellsTextStyle: context.regular14Black,
            disabledCellsTextStyle: context.regular14TextPlaceholder,
            selectedCellTextStyle: context.regular14White,
            selectedCellDecoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            currentDateDecoration: const BoxDecoration(),
          ),

          monthsPickerTheme: MonthsPickerTheme(
            inkResponseTheme: const InkResponseTheme(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            selectedCellDecoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),

          yearsPickerTheme: YearsPickerTheme(
            inkResponseTheme: const InkResponseTheme(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            currentDateDecoration: const BoxDecoration(),
            selectedCellDecoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
