import 'package:bloc/bloc.dart';
import 'package:digital_marketing/repository/auth_repository.dart';

import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState()) {
    //email change
    on<LoginEmailChanged>((event, emit) {
      emit(state.copywith(email: event.email));
    });
    //password change
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copywith(password: event.password));
    });
    //form submitted
    on<LoginFormSubmittedEvent>((event, emit) async {
      emit(state.copywith(status: FormSubmitting()));
      try {
        await authRepo.login(state.email, state.password);
        emit(state.copywith(status: FormSubmissionSuccess()));
      } catch (e) {
        //need to pass failure message
        emit(
          state.copywith(status: FormSubmissionFailed(Exception(e.toString()))),
        );
      }
    });
  }
}
