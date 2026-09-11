import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
    this.border,
    this.fillColor,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.textStyle,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.enabled,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.contentPadding,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.visualDensity,
    this.isDense,
  });

  final void Function()? onTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final InputBorder? border;
  final Color? fillColor;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final VisualDensity? visualDensity;
  final bool? isDense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      enabled: enabled,
      onChanged: onChanged,
      style: textStyle ?? context.regular16TextMain,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      cursorColor: AppColors.primary,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle:
            labelStyle ??
            context.regular16TextSub,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            context.regular16TextSub,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        fillColor: fillColor,
        filled: filled,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        visualDensity: visualDensity,
        isDense: isDense, 
      ),
    );
  }
}