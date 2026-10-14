import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
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
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _showClear) {
      setState(() {
        _showClear = hasText;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      child: AppTextField(
        controller: _controller,
        hintText: t.search,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textSub,
          size: 20,
        ),
        suffixIcon: _showClear
            ? GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    color: AppColors.textSub,
                    size: 18,
                  ),
                ),
              )
            : null,
        onChanged: (value) {},
      ),
    );
  }
}
