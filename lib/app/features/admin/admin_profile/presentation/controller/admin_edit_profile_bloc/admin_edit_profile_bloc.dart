import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_edit_profile_event.dart';
part 'admin_edit_profile_state.dart';

class AdminEditProfileBloc extends Bloc<AdminEditProfileEvent, AdminEditProfileState> {
  AdminEditProfileBloc() : super(AdminEditProfileInitial()) {
    on<AdminEditProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
