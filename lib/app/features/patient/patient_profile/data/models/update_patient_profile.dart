import 'dart:io';
import 'package:equatable/equatable.dart';

class UpdatePatientProfile extends Equatable {
  final String? name;
  final File? image;

  const UpdatePatientProfile({this.name, this.image});

  @override
  List<Object?> get props => [name, image];
}