import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/controller/patient_booking_bloc/patient_booking_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDateSelection extends StatelessWidget {
  const AppointmentDateSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 8),
      height: 270.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGray2),
      ),
      child: BlocBuilder<PatientBookingBloc, PatientBookingState>(
        builder: (context, state) {
          final bloc = context.read<PatientBookingBloc>();
          return DatePicker(
            padding: EdgeInsets.zero,
            maxDate: DateTime.now().add(const Duration(days: 365)),
            minDate: DateTime.now(),
            selectedDate: bloc.selectedDate,
            onDateSelected: (date) {
                    if (date == bloc.selectedDate) return;
                    bloc.add(GetDoctorAppointmentsRequested(date: date));
                  },
            theme: DatePickerPlusTheme(
              locale: Locale(LocaleSettings.currentLocale.languageCode),
              headerTheme: HeaderTheme(
                headerPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                leadingDateTextStyle: context.medium16White,
                forwardArrowWidget: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.white,
                  size: 22,
                ),
                backwardArrowWidget: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 22,
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
          );
        },
      ),
    );
  }
}
