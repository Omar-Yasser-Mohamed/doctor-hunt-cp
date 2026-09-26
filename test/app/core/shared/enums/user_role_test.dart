import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('user role testing', () {
    test("valid fromValue", () {
      expect(UserRole.fromValue("admin"), UserRole.admin);
      expect(UserRole.fromValue("patient"), UserRole.patient);
    });
    test("invalid fromValue", () {
      expect(
        () => UserRole.fromValue("invalid"),
        throwsA(isA<InvalidRoleException>()),
      );
    });
    test("valid value", () {
      expect(UserRole.admin.value, "admin");
      expect(UserRole.patient.value, "patient");
    });
  });
}