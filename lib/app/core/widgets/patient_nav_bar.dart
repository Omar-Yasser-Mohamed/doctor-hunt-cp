import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/patient_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PatientNavBar extends StatefulWidget {
  const PatientNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<PatientNavBar> createState() => _PatientNavBarState();
}

class _PatientNavBarState extends State<PatientNavBar> {
  final _drawerController = AdvancedDrawerController();

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  final List<String> _navIcons = [
    AppIcons.homeOutline,
    AppIcons.favorite,
    AppIcons.appointments,
    AppIcons.settings,
  ];

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerControllerProvider(
      controller: _drawerController,
      child: AdvancedDrawer(
        controller: _drawerController,
        backdrop: Container(
          decoration:const  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.drawerColors,
            ),
          ),
        ),
        drawer: const PatientDrawer(),
        openScale: .7,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Scaffold(
          extendBody: true,
          body: widget.navigationShell,
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              top: 12,
              left: 20.w,
              right: 20.w,
              bottom: context.bottomPadding + 6,
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
                  final isSelected =
                      widget.navigationShell.currentIndex == index;
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
                          child: SvgPicture.asset(
                            key: ValueKey(_navIcons[index]),
                            _navIcons[index],
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppColors.white
                                  : AppColors.unselectedIcon,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerControllerProvider
    extends InheritedNotifier<AdvancedDrawerController> {
  const DrawerControllerProvider({
    super.key,
    required AdvancedDrawerController controller,
    required super.child,
  }) : super(notifier: controller);

  static AdvancedDrawerController of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<DrawerControllerProvider>();

    assert(widget != null, 'DrawerControllerProvider not found');

    return widget!.notifier!;
  }
}
