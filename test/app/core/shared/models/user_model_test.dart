import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late User user;
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

  setUp(() {
    user = User(
      id: '1',
      email: 'omar@gmail.com',
      appMetadata: <String, dynamic>{},
      userMetadata: <String, dynamic>{
        'name': 'Omar',
        'user_role': 'admin'
      },
      createdAt: dateTime.toIso8601String(),
      updatedAt: dateTime.toIso8601String(),
      aud: 'aud',
    );
  });

  group('User Model test', () {
      test('valid user model from json', () {
        expect(UserModel.fromJson(json), userModel);
      });

      test('valid user model from auth supabase', () {
        expect(UserModel.fromAuthSupabase(user), userModel);
      });

      test("vaild to json", () {
        expect(userModel.toJson(), json);
      });
  });
}