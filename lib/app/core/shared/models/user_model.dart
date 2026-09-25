import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final UserRole userRole;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.userRole,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromAuth(User user) {
    final metadata = user.userMetadata ?? {};

    return UserModel(
      id: user.id,
      email: user.email ?? '',
      name: metadata['name'] ?? '',
      userRole: UserRole.fromValue(
        metadata['user_role'] ?? '',
      ),
      image: metadata['image'],
      createdAt: DateTime.parse(user.createdAt),
      updatedAt: DateTime.parse(
        metadata['updated_at'] ?? user.createdAt,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'user_role': userRole.name,
    'image': image,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    userRole,
    image,
    createdAt,
    updatedAt,
  ];
}
