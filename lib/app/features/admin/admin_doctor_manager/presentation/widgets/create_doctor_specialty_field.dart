import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateDoctorSpecialtyField extends StatefulWidget {
  const CreateDoctorSpecialtyField({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;

  @override
  State<CreateDoctorSpecialtyField> createState() =>
      _CreateDoctorSpecialtyFieldState();
}

class _CreateDoctorSpecialtyFieldState
    extends State<CreateDoctorSpecialtyField> {
  final MenuController _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final menuWidth = constraints.maxWidth;
        return MenuAnchor(
          crossAxisUnconstrained: false,
          controller: _menuController,
          alignmentOffset: const Offset(0, 4),
          style: MenuStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.white),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            elevation: const WidgetStatePropertyAll(4),
            minimumSize: WidgetStatePropertyAll(Size(menuWidth, 0)),
            maximumSize: WidgetStatePropertyAll(
              Size(menuWidth, double.infinity),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(
                  color: AppColors.textSub.withValues(alpha: 0.16),
                ),
              ),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            ),
          ),
          menuChildren: DoctorSpecialty.values.map((specialty) {
            return MenuItemButton(
              onPressed: () {
                widget.controller.text = specialty.title;
                context.read<DoctorManagementBloc>().add(
                  SelectDoctorSpecialty(specialty: specialty),
                );
              },
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  specialty.title.trim(),
                  style: context.medium14TextMain,
                ),
              ),
            );
          }).toList(),
          builder: (context, controller, child) {
            return AppTextField(
              readOnly: true,
              controller: widget.controller,
              hintText: t.selectSpecialty,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.secondary,
                size: 20,
              ),
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              validator: (value) => AppValidators.required(
                value,
                fieldName: t.specialty,
              ),
            );
          },
        );
      },
    );
  }
}
