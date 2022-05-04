import 'dart:async';

import 'package:digital_marketing/learn/user_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final UserRepos _userRepos;
  LoginBloc({
    required UserRepos userRepos,
  })  : _userRepos = userRepos,
        super(LoginStates.empty()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<Submitted>(_onSubmitted);
  }

  FutureOr<void> _emailChanged(
    EmailChanged event,
    Emitter<LoginStates> emit,
  ) {
    emit(state.update(isEmailValid: event.email.isNotEmpty));
  }

  FutureOr<void> _passwordChanged(
    PasswordChanged event,
    Emitter<LoginStates> emit,
  ) {
    emit(state.update(isPasswordValid: event.password.isNotEmpty));
  }

  FutureOr<void> _onSubmitted(
    Submitted event,
    Emitter<LoginStates> emit,
  ) async {
    var isEmailValid = event.email.isNotEmpty;
    var isPasswordValid = event.password.isNotEmpty;
    var newState = state.update(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
    );
    emit(newState);
    if (newState.isFormValid) {
      emit(LoginStates.loading());
      try {
        await _userRepos.signIn(event.email, event.password);
        emit(LoginStates.success());
      } catch (e) {
        emit(LoginStates.failure());
      }
    }
  }
}
