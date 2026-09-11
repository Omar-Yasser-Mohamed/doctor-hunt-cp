import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _imageSlideAnimation;
  late final Animation<double> _imageFadeAnimation;
  late final Animation<double> _imageScaleAnimation;

  late final Animation<Offset> _titleSlideAnimation;
  late final Animation<double> _titleFadeAnimation;

  late final Animation<Offset> _descSlideAnimation;
  late final Animation<double> _descFadeAnimation;

  @override
  void initState() {
    super.initState();
    _implementAnimations();
  }

  void _implementAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    // 1. Image drops from top, scales slightly, and fades in
    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.55, curve: Curves.easeOutCubic),
      ),
    );
    
    _imageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.50, curve: Curves.easeOut),
      ),
    );
    
    _imageScaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.55, curve: Curves.easeOutCubic),
      ),
    );
    
    // 2. Title slides up from down and fades in
    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.75, curve: Curves.easeOutCubic),
      ),
    );
    
    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.70, curve: Curves.easeOut),
      ),
    );
    
    // 3. Description follows the title: slides up from down and fades in
    _descSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.95, curve: Curves.easeOutCubic),
      ),
    );
    
    _descFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.90, curve: Curves.easeOut),
      ),
    );
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        90.height,

        SlideTransition(
          position: _imageSlideAnimation,
          child: FadeTransition(
            opacity: _imageFadeAnimation,
            child: ScaleTransition(
              scale: _imageScaleAnimation,
              child: ClipOval(
                child: Image.asset(
                  widget.image,
                  width: 336.w,
                  height: 336.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        80.height,

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: [
              SlideTransition(
                position: _titleSlideAnimation,
                child: FadeTransition(
                  opacity: _titleFadeAnimation,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: context.bold24TextMain,
                  ),
                ),
              ),

              11.height,

              SlideTransition(
                position: _descSlideAnimation,
                child: FadeTransition(
                  opacity: _descFadeAnimation,
                  child: Text(
                    widget.description,
                    style: context.regular14TextSub,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
