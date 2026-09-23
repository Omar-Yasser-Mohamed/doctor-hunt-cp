import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'choose_role_event.dart';

@injectable
class ChooseRoleBloc extends Bloc<ChooseRoleEvent, UserRole> {
  ChooseRoleBloc() : super(UserRole.patient) {
    on<SelectRole>(_onSelectRole);
  }

  void _onSelectRole(SelectRole event, Emitter<UserRole> emit) {
    if (state == event.userRole) return;
    emit(event.userRole);
  }
}
