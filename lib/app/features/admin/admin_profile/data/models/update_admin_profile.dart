import 'dart:io';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:equatable/equatable.dart';

class UpdateAdminProfileRequest extends Equatable {
  final String? name;
  final File? photo;
  final LocationModel? location;

  const UpdateAdminProfileRequest({
    this.name,
    this.photo,
    this.location,
  });

  bool get isEmpty => name == null && photo == null && location == null;
  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [name, photo?.path, location];
}
