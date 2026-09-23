import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';

class RegisterRequest {
  final String name;
  final UserRole userRole;
  final String email;
  final String password;

  RegisterRequest({
    required this.name,
    required this.userRole,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_role": userRole.name,
    "email": email,
    "password": password,
  };
}