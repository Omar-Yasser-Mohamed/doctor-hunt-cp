import 'package:doctor_hunt/app/core/shared/controllers/locale_bloc/locale_bloc.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppLanguageBottomSheet extends StatelessWidget {
  const AppLanguageBottomSheet({super.key});

  static Future<AppLocale?> show(BuildContext context) {
    return showModalBottomSheet<AppLocale>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => const AppLanguageBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final currentLocale = state.locale;

        return Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: context.bottomPadding + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  margin: const EdgeInsets.only(top: 12, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.bottomSheetNotice,
                  ),
                ),
              ),
              Text(
                t.selectLanguage,
                style: context.bold18TextMain,
              ),
              4.height,
              Text(
                t.choosePreferredLanguage,
                style: context.regular12TextSub,
              ),
              20.height,
              _LanguageOptionTile(
                locale: AppLocale.ar,
                badgeText: 'AR',
                title: t.arabic,
                subtitle: t.arabicSubtitle,
                isSelected: currentLocale == AppLocale.ar,
                onTap: () => _onSelectLanguage(context, AppLocale.ar),
              ),
              12.height,
              _LanguageOptionTile(
                locale: AppLocale.en,
                badgeText: 'EN',
                title: t.english,
                subtitle: t.englishSubtitle,
                isSelected: currentLocale == AppLocale.en,
                onTap: () => _onSelectLanguage(context, AppLocale.en),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSelectLanguage(BuildContext context, AppLocale locale) {
    context.read<LocaleBloc>().add(ChangeLocaleEvent(locale));
    context.pop(locale);
  }
}

class _LanguageOptionTile extends StatelessWidget {
  final AppLocale locale;
  final String badgeText;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOptionTile({
    required this.locale,
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.activeLight,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: AppColors.primary,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            )
          : BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: AppColors.border,
                width: 1,
              ),
            ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          onTap: onTap,
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.graySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              badgeText,
              style: isSelected ? context.bold14White : context.bold14TextSub,
            ),
          ),
          title: Text(
            title,
            style: isSelected
                ? context.semiBold16Primary
                : context.medium16TextMain,
          ),
          subtitle: Text(
            subtitle,
            style: context.regular12TextSub,
          ),
          trailing: isSelected
              ? Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 16,
                    color: AppColors.white,
                  ),
                )
              : Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.gray300,
                      width: 1.5,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
