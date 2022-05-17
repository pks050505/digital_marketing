import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

const successMessage = 'Login Successfully';
const passFail = 'Password can not be blank';
const emailFail = 'Email can not be blank';
const bothFail = 'Username And Password is incorrect';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
      password: state.password,
      loginStatus: event.email.isNotEmpty && state.password.isNotEmpty
          ? LoginStatus.ready
          : LoginStatus.initial,
    ));
    // final username = Username.dirty(event.username);
    // emit(state.copyWith(
    //   username: username,
    //   status: Formz.validate([state.password, username]),
    // ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
      email: state.email,
      loginStatus: event.password.isNotEmpty && state.email.isNotEmpty
          ? LoginStatus.ready
          : LoginStatus.initial,
    ));
    //final password = Password.dirty(event.password);
    // emit(state.copyWith(
    //   password: password,
    //   status: Formz.validate([password, state.username]),
    // ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.loginStatus == LoginStatus.ready) {
      emit(state.copyWith(loginStatus: LoginStatus.operationInProgress));
      try {
        var message = await _authRepository.signIn(
          email: state.email,
          password: state.password,
        );
        if (message == emailFail ||
            message == passFail ||
            message == bothFail) {
          emit(state.copyWith(
              message: message, loginStatus: LoginStatus.failed));
        } else {
          emit(state.copyWith(
              loginStatus: LoginStatus.success, message: successMessage));
        }
      } catch (e) {
        emit(state.copyWith(
            message:
                'Are you connected to Internet? \n Check your Internet Connection',
            loginStatus: LoginStatus.failed));
      }
    }
    // if (state.email.isEmpty || state.password.isEmpty) {
    //   emit(state.copyWith(loginStatus: LoginStatus.initial));
    // } else if (state.email.isNotEmpty && state.password.isNotEmpty) {
    //   emit(state.copyWith(loginStatus: LoginStatus.ready));
    // }
    // if (state.status.isValidated) {
    //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
    //   try {
    //     var message = await _authRepository.signIn(
    //       email: state.username.value,
    //       password: state.password.value,
    //     );

    //     emit(state.copyWith(
    //         status: FormzStatus.submissionSuccess, message: message));
    //   } catch (_) {
    //     emit(
    //       state.copyWith(
    //           status: FormzStatus.submissionFailure,
    //           message: 'Are You Connected To Internet!'),
    //     );
    //   }
    // }
  }
}
