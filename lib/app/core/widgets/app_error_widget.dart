import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.failure,
    this.message,
    this.title,
    this.onRetry,
    this.retryText,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
  }) : assert(
         failure != null || message != null,
         'Either failure or message must be provided to AppErrorWidget',
       );

  /// Convenience constructor when an [Failure] instance is directly available from state.
  const AppErrorWidget.fromFailure({
    Key? key,
    required Failure failure,
    String? title,
    VoidCallback? onRetry,
    String? retryText,
    IconData? icon,
    Color? iconColor,
    Color? iconBackgroundColor,
  }) : this(
         key: key,
         failure: failure,
         title: title,
         onRetry: onRetry,
         retryText: retryText,
         icon: icon,
         iconColor: iconColor,
         iconBackgroundColor: iconBackgroundColor,
       );

  final Failure? failure;
  final String? message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  IconData _resolveIcon() {
    if (icon != null) return icon!;

    if (failure != null) {
      switch (failure!.code) {
        case FailureCode.network:
        case FailureCode.timeout:
          return Icons.wifi_off_rounded;
        case FailureCode.notFound:
        case FailureCode.userNotFound:
          return Icons.search_off_rounded;
        case FailureCode.unauthorized:
        case FailureCode.forbidden:
        case FailureCode.permissionDenied:
          return Icons.lock_outline_rounded;
        default:
          return Icons.error_outline_rounded;
      }
    }

    return Icons.error_outline_rounded;
  }

  String get _displayMessage {
    if (message != null && message!.trim().isNotEmpty) {
      return message!;
    }
    if (failure != null && failure!.message.trim().isNotEmpty) {
      return failure!.message;
    }
    return t.errors.serverError;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? AppColors.danger;
    final effectiveBgColor = iconBackgroundColor ?? AppColors.dangerLight;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Error Icon Container with subtle layered badge if retry is available
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: effectiveBgColor,
                    border: Border.all(
                      color: effectiveIconColor.withValues(alpha: 0.15),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _resolveIcon(),
                    size: 40,
                    color: effectiveIconColor,
                  ),
                ),
                if (onRetry != null)
                  Positioned(
                    bottom: -4,
                    right: context.isArabic ? null : -4,
                    left: context.isArabic ? -4 : null,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                        border: Border.all(color: AppColors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.refresh_rounded,
                        size: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),

            20.height,

            // Optional Title
            if (title != null) ...[
              Text(
                title!,
                style: context.bold16TextMain,
                textAlign: TextAlign.center,
              ),
              8.height,
              Text(
                _displayMessage,
                style: context.regular12TextPlaceholder,
                textAlign: TextAlign.center,
              ),
            ] else
              Text(
                _displayMessage,
                style: context.medium14TextSub,
                textAlign: TextAlign.center,
              ),

            // Retry Button (shown ONLY when onRetry != null)
            if (onRetry != null) ...[
              20.height,
              AppButton(
                text: retryText ?? t.retry,
                onPressed: onRetry,
                width: 140.w,
                height: 42.h,
                radius: 12.r,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.refresh_rounded,
                      size: 18,
                      color: AppColors.white,
                    ),
                    8.width,
                    Text(
                      retryText ?? t.retry,
                      style: context.medium14White,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Sliver variant of [AppErrorWidget] for use directly inside sliver lists or CustomScrollView.
class AppErrorSliver extends StatelessWidget {
  const AppErrorSliver({
    super.key,
    this.failure,
    this.message,
    this.title,
    this.onRetry,
    this.retryText,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
  });

  const AppErrorSliver.fromFailure({
    Key? key,
    required Failure failure,
    String? title,
    VoidCallback? onRetry,
    String? retryText,
    IconData? icon,
    Color? iconColor,
    Color? iconBackgroundColor,
  }) : this(
         key: key,
         failure: failure,
         title: title,
         onRetry: onRetry,
         retryText: retryText,
         icon: icon,
         iconColor: iconColor,
         iconBackgroundColor: iconBackgroundColor,
       );

  final Failure? failure;
  final String? message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppErrorWidget(
        failure: failure,
        message: message,
        title: title,
        onRetry: onRetry,
        retryText: retryText,
        icon: icon,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
      ),
    );
  }
}

/// Type alias for developers referring to FailureWidget.
typedef AppFailureWidget = AppErrorWidget;
