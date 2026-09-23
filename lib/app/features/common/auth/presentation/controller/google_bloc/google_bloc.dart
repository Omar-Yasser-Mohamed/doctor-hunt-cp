import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
part 'google_event.dart';
part 'google_state.dart';

@injectable
class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc(this._authRepo) : super(GoogleInitial()) {
    on<GoogleSubmitted>(onGoogleSubmitted);
  }
  final AuthRepo _authRepo;

  Future<void> onGoogleSubmitted(
    GoogleSubmitted event,
    Emitter<GoogleState> emit,
  ) async {
    emit(GoogleLoading());

    final result = await _authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(GoogleFailure(failure: failure)),
      (_) {
        emit(GoogleSuccess());
      },
    );
  }
}
