import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/controller/find_doctors_bloc/find_doctors_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorsSearchBar extends StatefulWidget {
  const FindDoctorsSearchBar({super.key});

  @override
  State<FindDoctorsSearchBar> createState() => _FindDoctorsSearchBarState();
}

class _FindDoctorsSearchBarState extends State<FindDoctorsSearchBar> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FindDoctorsBloc>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .08),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: AppTextField(
        controller: _searchController,
        hintText: t.search,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _searchController.clear();
            context.read<FindDoctorsBloc>().add(ClearSearchEvent());
          },
          behavior: HitTestBehavior.opaque,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.close,
              color: AppColors.textSub,
            ),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textSub,
        ),
        onChanged: (value) {
          context.read<FindDoctorsBloc>().add(
            SearchForDoctorsEvent(query: value),
          );
        },
      ),
    );
  }
}
