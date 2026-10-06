import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateDoctorPhotoPicker extends StatelessWidget {
  const CreateDoctorPhotoPicker({super.key});

  void _onAddPhoto(BuildContext context) async {
    final result = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const _ImageSourceBottomSheet(),
    );
    if (result != null) {
      context.read<DoctorManagementBloc>().add(
        PickDoctorProfileImage(source: result),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _onAddPhoto(context),
          behavior: HitTestBehavior.opaque,
          child: BlocBuilder<DoctorManagementBloc, DoctorManagementState>(
            builder: (context, state) {
              final imageFile = context
                  .read<DoctorManagementBloc>()
                  .doctorImage;
              final hasPickedImage = imageFile != null;
              return CustomPaint(
                painter: _DashedCirclePainter(
                  color: hasPickedImage
                      ? AppColors.primary
                      : AppColors.textPlaceholder,
                  strokeWidth: 2,
                  dashLength: 6,
                  gapLength: 4,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: hasPickedImage
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Image.file(
                                imageFile,
                                width: 96.w,
                                height: 96.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 4.w,
                              right: 4.w,
                              child: GestureDetector(
                                onTap: () => context
                                    .read<DoctorManagementBloc>()
                                    .add(RemoveDoctorProfileImage()),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.dangerLight,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(4.w),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.danger,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: 96.w,
                          height: 96.w,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 26.sp,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),

        16.height,

        GestureDetector(
          onTap: () => _onAddPhoto(context),
          child: Text(
            t.addPhoto,
            style: context.medium12Primary,
          ),
        ),
      ],
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
  });

  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double circumference = 2 * math.pi * radius;
    final double totalDash = dashLength + gapLength;
    final int count = (circumference / totalDash).floor();
    final double adjustedTotal = circumference / count;
    final double actualDashLength = adjustedTotal * (dashLength / totalDash);
    final double dashAngle = (actualDashLength / circumference) * 2 * math.pi;
    final double stepAngle = (adjustedTotal / circumference) * 2 * math.pi;

    for (int i = 0; i < count; i++) {
      final double startAngle = i * stepAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashLength != dashLength ||
        oldDelegate.gapLength != gapLength;
  }
}

class _ImageSourceBottomSheet extends StatelessWidget {
  const _ImageSourceBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: Text(t.camera),
            onTap: () => context.pop(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(t.gallery),
            onTap: () => context.pop(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}
