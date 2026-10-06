import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/delete_doctor_confirmation_dialog.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditDoctorActions extends StatelessWidget {
  const EditDoctorActions({
    super.key,
    required this.doctor,
    required this.hasChanges,
    required this.onSave,
  });

  final DoctorModel doctor;
  final bool hasChanges;
  final VoidCallback onSave;

  Future<void> _onDeleteDoctor(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => const DeleteDoctorConfirmationDialog(),
    );

    if (confirmed == true && context.mounted) {
      context.read<DoctorManagementBloc>().add(
        DeleteDoctor(doctorId: doctor.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorManagementBloc, DoctorManagementState>(
      listenWhen: (_, current) =>
          current is DoctorManagementUpdateSuccess ||
          current is DoctorManagementDeleteSuccess ||
          current is DoctorManagementFailure,
      listener: (context, state) {
        if (state is DoctorManagementUpdateSuccess) {
          AppToasts.showSuccess(context, t.doctorUpdatedSuccessfully);
          context.pop();
        } else if (state is DoctorManagementDeleteSuccess) {
          AppToasts.showSuccess(context, t.doctorDeletedSuccessfully);
          const AdminDoctorsRoute().go(context);
        } else if (state is DoctorManagementFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      buildWhen: (_, current) =>
          current is DoctorManagementUpdateLoading ||
          current is DoctorManagementUpdateSuccess ||
          current is DoctorManagementDeleteLoading ||
          current is DoctorManagementDeleteSuccess ||
          current is DoctorManagementFailure,
      builder: (context, state) {
        final isUpdateLoading = state is DoctorManagementUpdateLoading;
        final isDeleteLoading = state is DoctorManagementDeleteLoading;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: t.saveChanges,
              height: 50.h,
              radius: 12.r,
              isLoading: isUpdateLoading,
              textStyle: context.semiBold16White,
              onPressed: (hasChanges && !isDeleteLoading) ? onSave : null,
            ),

            SizedBox(height: 12.h),

            AppOutlineButton(
              text: t.deleteDoctor,
              height: 50.h,
              radius: 12.r,
              isLoading: isDeleteLoading,
              loadingIndicatorColor: AppColors.inactive,
              backgroundColor: AppColors.inactiveLight,
              borderColor: AppColors.inactive,
              onPressed: (isUpdateLoading || isDeleteLoading)
                  ? null
                  : () => _onDeleteDoctor(context),
              child: Text(
                t.deleteDoctor,
                style: context.semiBold16TextMain.copyWith(
                  color: AppColors.inactive,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
