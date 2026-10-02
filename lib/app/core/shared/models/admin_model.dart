import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {
  final String userId;
  final String? address;
  final double? latitude;
  final double? longitude;

  const AdminModel({
    required this.userId,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      userId: json['user_id'] as String,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
  };

  AdminModel copyWith({
    String? userId,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return AdminModel(
      userId: userId ?? this.userId,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    address,
    latitude,
    longitude,
  ];
}