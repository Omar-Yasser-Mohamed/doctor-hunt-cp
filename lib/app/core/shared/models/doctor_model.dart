import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/admin_model.dart';
import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String id;
  final String adminId;
  final String name;
  final DoctorSpecialty specialty;
  final String? photo;
  final String? title;
  final double fees;
  final bool isActive;
  final int reviewsCount;
  final double rating;
  final DateTime createdAt;

  final AdminModel? admin;

  const DoctorModel({
    required this.id,
    required this.adminId,
    required this.name,
    required this.specialty,
    this.photo,
    this.title,
    required this.fees,
    required this.isActive,
    required this.reviewsCount,
    required this.rating,
    required this.createdAt,
    this.admin,
  });

  String? get address => admin?.address;
  double? get latitude => admin?.latitude;
  double? get longitude => admin?.longitude;

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as String,
      adminId: json['admin_id'] as String,
      name: json['name'] as String,
      specialty: DoctorSpecialty.fromValue(json['specialty'] as String),
      photo: json['photo'] as String?,
      title: json['title'] as String?,
      fees: (json['fees'] as num).toDouble(),
      isActive: json['is_active'] as bool,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['created_at'] as String),
      admin: json['admin'] != null
          ? AdminModel.fromJson(json['admin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'admin_id': adminId,
    'name': name,
    'specialty': specialty,
    'photo': photo,
    'title': title,
    'fees': fees,
    'is_active': isActive,
    'reviews_count': reviewsCount,
    'rating': rating,
    'created_at': createdAt.toIso8601String(),
    'admin': admin?.toJson(),
  };

  @override
  List<Object?> get props => [
    id,
    adminId,
    name,
    specialty,
    photo,
    title,
    fees,
    isActive,
    reviewsCount,
    rating,
    createdAt,
    admin,
  ];

  DoctorModel copyWith({
    String? id,
    String? adminId,
    String? name,
    DoctorSpecialty? specialty,
    String? photo,
    String? title,
    double? fees,
    bool? isActive,
    int? reviewsCount,
    double? rating,
    DateTime? createdAt,
    AdminModel? admin,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      adminId: adminId ?? this.adminId,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      photo: photo ?? this.photo,
      title: title ?? this.title,
      fees: fees ?? this.fees,
      isActive: isActive ?? this.isActive,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      admin: admin ?? this.admin,
    );
  }
}
