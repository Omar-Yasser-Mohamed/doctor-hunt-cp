import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/update_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/create_doctor_field_label.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_actions.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_specialty_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_status_card.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDoctorForm extends StatefulWidget {
  const EditDoctorForm({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<EditDoctorForm> createState() => _EditDoctorFormState();
}

class _EditDoctorFormState extends State<EditDoctorForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late final TextEditingController _nameController;
  late final TextEditingController _feeController;
  late final TextEditingController _specialtyController;

  late bool _isActive;
  bool _hasPickedImage = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.doctor.name);
    _feeController = TextEditingController(
      text: widget.doctor.fees.toStringAsFixed(2),
    );
    _specialtyController = TextEditingController(
      text: widget.doctor.specialty.title,
    );
    _isActive = widget.doctor.isActive;

    _nameController.addListener(_onFieldChanged);
    _feeController.addListener(_onFieldChanged);
    _specialtyController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _nameController.removeListener(_onFieldChanged);
    _feeController.removeListener(_onFieldChanged);
    _specialtyController.removeListener(_onFieldChanged);
    _nameController.dispose();
    _feeController.dispose();
    _specialtyController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {});
  }

  DoctorSpecialty? get _currentSelectedSpecialty {
    final blocSpecialty = context
        .read<DoctorManagementBloc>()
        .selectedSpecialty;
    return blocSpecialty ?? widget.doctor.specialty;
  }

  bool get _hasChanges {
    final nameChanged = _nameController.text.trim() != widget.doctor.name;
    final feeText = _feeController.text.trim();
    final parsedFee = double.tryParse(feeText);
    final feeChanged = parsedFee != null && parsedFee != widget.doctor.fees;
    final specialtyChanged =
        _currentSelectedSpecialty != null &&
        _currentSelectedSpecialty != widget.doctor.specialty;
    final statusChanged = _isActive != widget.doctor.isActive;

    return nameChanged ||
        feeChanged ||
        specialtyChanged ||
        statusChanged ||
        _hasPickedImage;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final nameChanged = _nameController.text.trim() != widget.doctor.name;
      final feeText = _feeController.text.trim();
      final parsedFee = double.tryParse(feeText);
      final feeChanged = parsedFee != null && parsedFee != widget.doctor.fees;
      final selectedSpecialty = _currentSelectedSpecialty;
      final specialtyChanged =
          selectedSpecialty != null &&
          selectedSpecialty != widget.doctor.specialty;
      final statusChanged = _isActive != widget.doctor.isActive;

      final pickedImage = context.read<DoctorManagementBloc>().doctorImage;

      final request = UpdateDoctorRequest(
        id: widget.doctor.id,
        name: nameChanged ? _nameController.text.trim() : null,
        specialty: specialtyChanged ? selectedSpecialty : null,
        fees: feeChanged ? parsedFee : null,
        isActive: statusChanged ? _isActive : null,
        photo: pickedImage,
      );

      context.read<DoctorManagementBloc>().add(
        UpdateDoctor(request: request),
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorManagementBloc, DoctorManagementState>(
      listenWhen: (_, current) =>
          current is DoctorManagementImagePicked ||
          current is DoctorManagementImageRemoved,
      listener: (context, state) {
        if (state is DoctorManagementImagePicked && !_hasPickedImage) {
          setState(() => _hasPickedImage = true);
        } else if (state is DoctorManagementImageRemoved && _hasPickedImage) {
          setState(() => _hasPickedImage = false);
        }
      },
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateDoctorFieldLabel(label: t.doctorName),

            8.height,

            AppTextField(
              controller: _nameController,
              hintText: t.doctorNameHint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.secondary,
                size: 20,
              ),
              textInputAction: TextInputAction.next,
              validator: (value) => AppValidators.required(
                value,
                fieldName: t.doctorName,
              ),
            ),

            16.height,

            CreateDoctorFieldLabel(label: t.specialty),

            8.height,

            EditDoctorSpecialtyField(controller: _specialtyController),

            16.height,

            CreateDoctorFieldLabel(label: t.consultationFee),

            8.height,

            AppTextField(
              controller: _feeController,
              hintText: t.consultationFeeHint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: const Icon(
                Icons.attach_money_rounded,
                color: AppColors.secondary,
                size: 20,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.done,
              validator: (value) => AppValidators.positiveNumber(
                value,
                fieldName: t.consultationFee,
              ),
            ),

            16.height,

            EditDoctorStatusCard(
              isActive: _isActive,
              onChanged: (value) {
                setState(() => _isActive = value);
              },
            ),

            32.height,

            EditDoctorActions(
              doctor: widget.doctor,
              hasChanges: _hasChanges,
              onSave: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
