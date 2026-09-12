
import 'package:doctor_hunt/generated/translations.g.dart';

abstract final class AppValidators {
  static String? required(
    String? value,
    Translations translations, {
    String fieldName = 'Field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return translations.validations.required(fieldName: fieldName);
    }

    return null;
  }

  static String? email(
    String? value,
    Translations translations,
  ) {
    if (value == null || value.trim().isEmpty) {
      return translations.validations.emailRequired;
    }

    final emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return translations.validations.invalidEmail;
    }

    return null;
  }

  static String? password(
    String? value,
    Translations translations,
  ) {
    if (value == null || value.isEmpty) {
      return translations.validations.passwordRequired;
    }

    if (value.length < 8) {
      return translations.validations.passwordMinLength;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return translations.validations.passwordRequiresUppercase;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return translations.validations.passwordRequiresLowercase;
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return translations.validations.passwordRequiresNumber;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\[\]/`~;+=]').hasMatch(value)) {
      return translations.validations.passwordRequiresSpecialCharacter;
    }

    return null;
  }

  static String? name(
    String? value,
    Translations translations,
  ) {
    if (value == null || value.trim().isEmpty) {
      return translations.validations.nameRequired;
    }

    if (value.trim().length < 3) {
      return translations.validations.nameMinLength;
    }

    return null;
  }

}