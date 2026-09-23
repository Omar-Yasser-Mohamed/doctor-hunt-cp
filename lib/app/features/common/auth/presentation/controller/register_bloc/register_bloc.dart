import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._authRepo) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegister);
  }
  final AuthRepo _authRepo;

  Future<void> _onRegister(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final result = await _authRepo.signUp(
      RegisterRequest(
        name: event.name,
        userRole: event.userRole,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(RegisterFailure(failure)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
