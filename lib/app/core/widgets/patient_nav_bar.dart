import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PatientNavBar extends StatelessWidget {
  const PatientNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.menu_book_rounded,
    Icons.sms_rounded,
  ];

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 12,
          left: 20.w,
          right: 20.w,
          bottom: bottomPadding + 6,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .25),
              blurRadius: 180,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: List.generate(_navIcons.length, (index) {
              final isSelected = navigationShell.currentIndex == index;
              return Expanded(
                child: InkResponse(
                  onTap: () => _onItemTapped(index),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        key: ValueKey(_navIcons[index]),
                        _navIcons[index],
                        color: isSelected
                            ? AppColors.white
                            : AppColors.unselectedIcon,
                        size: 24.w,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
