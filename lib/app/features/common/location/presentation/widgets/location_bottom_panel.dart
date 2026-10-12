import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/widgets/location_confirm_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationBottomPanel extends StatelessWidget {
  const LocationBottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
      buildWhen: (previous, current) =>
          previous.address != current.address ||
          previous.isLoadingAddress != current.isLoadingAddress ||
          previous.canConfirm != current.canConfirm,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.paddingOf(context).bottom + 16.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bottom sheet drag indicator handle
              Center(
                child: Container(
                  width: 40.w,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bottomSheetNotice,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              16.height,
              // Address Row / Card
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  12.width,
                  Expanded(
                    child: state.isLoadingAddress
                        ? Row(
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                              10.width,
                              Expanded(
                                child: Text(
                                  t.loading,
                                  style: context.regular14TextSub,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            state.address ?? t.tapToSelectLocation,
                            style: state.address != null
                                ? context.medium14TextMain
                                : context.regular14TextSub,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ],
              ),

              // Confirm button visible only when a valid location is picked
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: state.canConfirm
                    ? Column(
                        key: const ValueKey('confirm_button'),
                        children: [
                          16.height,
                          const LocationConfirmButton(),
                        ],
                      )
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
