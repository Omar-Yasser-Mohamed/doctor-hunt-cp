import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/admin_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:equatable/equatable.dart';

class CurrentUserModel extends Equatable {
  final UserModel user;
  final AdminModel? admin;

  const CurrentUserModel({
    required this.user,
    this.admin,
  });

  bool get isAdmin => user.userRole == UserRole.admin;
  bool get isPatient => user.userRole == UserRole.patient;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      admin: json['admin'] != null
          ? AdminModel.fromJson(json['admin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'admin': admin?.toJson(),
  };

  @override
  List<Object?> get props => [user, admin];
}