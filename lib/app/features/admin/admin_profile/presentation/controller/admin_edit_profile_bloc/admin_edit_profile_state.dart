part of 'admin_edit_profile_bloc.dart';

sealed class AdminEditProfileState extends Equatable {
  const AdminEditProfileState();
  
  @override
  List<Object> get props => [];
}

final class AdminEditProfileInitial extends AdminEditProfileState {}
