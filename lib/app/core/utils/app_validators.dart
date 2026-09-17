import 'package:doctor_hunt/generated/translations.g.dart';

abstract final class AppValidators {
  static String? required(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return t.validations.required(fieldName: fieldName);
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return t.validations.emailRequired;
    }

    final emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return t.validations.invalidEmail;
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return t.validations.passwordRequired;
    }

    if (value.length < 8) {
      return t.validations.passwordMinLength;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return t.validations.passwordRequiresUppercase;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return t.validations.passwordRequiresLowercase;
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return t.validations.passwordRequiresNumber;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\[\]/`~;+=]').hasMatch(value)) {
      return t.validations.passwordRequiresSpecialCharacter;
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return t.validations.confirmPasswordRequired;
    }

    if (value != password) {
      return t.validations.passwordsDoNotMatch;
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return t.validations.nameRequired;
    }

    if (value.trim().length < 3) {
      return t.validations.nameMinLength;
    }

    return null;
  }
}
