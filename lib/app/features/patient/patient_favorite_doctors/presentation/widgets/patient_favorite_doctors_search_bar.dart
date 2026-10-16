import 'package:doctor_hunt/app/core/shared/controllers/locale_bloc/locale_bloc.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/controller/patient_favorite_doctors_bloc/patient_favorite_doctors_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientFavoriteDoctorsSearchBar extends StatefulWidget {
  const PatientFavoriteDoctorsSearchBar({super.key});

  @override
  State<PatientFavoriteDoctorsSearchBar> createState() =>
      _PatientFavoriteDoctorsSearchBarState();
}

class _PatientFavoriteDoctorsSearchBarState
    extends State<PatientFavoriteDoctorsSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientFavoriteDoctorsBloc>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.07),
            blurRadius: 40,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return AppTextField(
            controller: _controller,
            hintText: t.search,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.textSub,
              size: 22,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                _controller.clear();
                bloc.add(const ClearSearchEvent());
              },
              behavior: HitTestBehavior.opaque,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: AppColors.textSub,
                  size: 22,
                ),
              ),
            ),
            onChanged: (value) {
              bloc.add(SearchInMyFavoriteDoctorsEvent(query: value));
            },
          );
        },
      ),
    );
  }
}
