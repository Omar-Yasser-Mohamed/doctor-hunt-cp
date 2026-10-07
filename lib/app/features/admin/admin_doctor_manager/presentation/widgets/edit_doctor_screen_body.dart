import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_form.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_photo_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDoctorScreenBody extends StatelessWidget {
  const EditDoctorScreenBody({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      child: Column(
        children: [
          EditDoctorPhotoPicker(doctor: doctor),

          20.height,

          EditDoctorForm(doctor: doctor),
        ],
      ),
    );
  }
}
