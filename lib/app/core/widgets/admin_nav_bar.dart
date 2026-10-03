import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AdminNavBar extends StatelessWidget {
  const AdminNavBar({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.secondaryLight,
          selectedLabelStyle: context.bold12Primary,
          unselectedLabelStyle: context.regular12SecondaryLight,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(
                  AppIcons.medical,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 0
                        ? AppColors.primary
                        : AppColors.secondaryLight,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: t.doctors,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SvgPicture.asset(
                  AppIcons.appointments,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 1
                        ? AppColors.primary
                        : AppColors.secondaryLight,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: t.appointments,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SvgPicture.asset(
                  AppIcons.settings,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 2
                        ? AppColors.primary
                        : AppColors.secondaryLight,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: t.settings,
            ),
          ],
        ),
      ),
    );
  }
}
