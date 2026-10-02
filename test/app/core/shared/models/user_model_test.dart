import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final DateTime dateTime = DateTime.now();
  
  final UserModel userModel = UserModel(
    id: '1',
    email: 'omar@gmail.com',
    name: 'Omar',
    userRole: UserRole.admin,
    image: null,
    createdAt: dateTime,
    updatedAt: dateTime,
  );

  final Map<String, dynamic> json = {
    'id': '1',
    'email': 'omar@gmail.com',
    'name': 'Omar',
    'user_role': 'admin',
    'image': null,
    'created_at': dateTime.toIso8601String(),
    'updated_at': dateTime.toIso8601String(),
  };

  group('User Model test', () {
      test('valid user model from json', () {
        expect(UserModel.fromJson(json), userModel);
      });

      test("vaild to json", () {
        expect(userModel.toJson(), json);
      });
  });
}