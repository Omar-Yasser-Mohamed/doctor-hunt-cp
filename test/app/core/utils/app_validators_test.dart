import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppValidators Test', () {
    //Email
    group('Email test', () {
      test('return message when email is empty', () {
        expect(AppValidators.email(''), t.validations.emailRequired);
      });

      test('return message when email is invalid', () {
        expect(AppValidators.email('omargmail.com'), t.validations.invalidEmail);
      });

      test('return null when email is valid', () {
        expect(AppValidators.email('omar@gmail.com'), null);
      });
    });

    //Name
    group('Name test', () {
      test('return message when name is empty', () {
        expect(AppValidators.name(''), t.validations.nameRequired);
      });

      test('return message when name is less than min length', () {
        expect(AppValidators.name('om'), t.validations.nameMinLength);
      });

      test('return null when name is valid', () {
        expect(AppValidators.name('Omar'), null);
      });
    });
    
    //Password
    group('Password test', () {
      test('invalid password (required)', () {
        expect(AppValidators.password(''), t.validations.passwordRequired);
      });

      test('invalid password (less than min length)', () {
        expect(AppValidators.password('123457'), t.validations.passwordMinLength);
      });

      test('invalid password (no uppercase)', () {
        expect(AppValidators.password('omar123!'), t.validations.passwordRequiresUppercase);
      });

      test('invalid password (no lowercase)', () {
        expect(AppValidators.password('OMAR123!'), t.validations.passwordRequiresLowercase);
      });

      test('invalid password (no number)', () {
        expect(AppValidators.password('omarABC!'), t.validations.passwordRequiresNumber);
      });

      test('invalid password (no special character)', () {
        expect(AppValidators.password('Omar1234'), t.validations.passwordRequiresSpecialCharacter);
      });

      test('valid password', () {
        expect(AppValidators.password('Omar123!'), null);
      });
    });

    //Confirm Password
    group('Confirm Password test', () {
      test('return message when confirm password is empty', () {
        expect(AppValidators.confirmPassword('', 'Omar123!'), t.validations.confirmPasswordRequired);
      });

      test('return message when confirm password is not equal to password', () {
        expect(AppValidators.confirmPassword('omar123!', 'omar123'), t.validations.passwordsDoNotMatch);
      });

      test('return null when confirm password is valid', () {
        expect(AppValidators.confirmPassword('Omar123!', 'Omar123!'), null);
      });
    });
  });
}
