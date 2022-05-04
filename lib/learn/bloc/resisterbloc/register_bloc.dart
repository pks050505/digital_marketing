import 'dart:async';

import 'package:digital_marketing/learn/bloc/resisterbloc/register_event.dart';
import 'package:digital_marketing/learn/bloc/resisterbloc/register_state.dart';
import 'package:digital_marketing/learn/user_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepos _userRepos;
  RegisterBloc({required UserRepos userRepos})
      : _userRepos = userRepos,
        super(RegisterState.empty()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<NameChanged>(_nameChanged);
    on<Submitted>(_submitted);
  }

  FutureOr<void> _emailChanged(
      EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isEmailValid: event.email.isNotEmpty));
  }

  FutureOr<void> _passwordChanged(
      PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isPasswordValid: event.password.isNotEmpty));
  }

  FutureOr<void> _nameChanged(NameChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isNameValid: event.name.isNotEmpty));
  }

  FutureOr<void> _submitted(
      Submitted event, Emitter<RegisterState> emit) async {
    var isEmailValid = event.email.isNotEmpty;
    var isPasswordValid = event.password.isNotEmpty;
    var isNameValid = event.name.isNotEmpty;
    var newState = state.update(
      isEmailValid: isEmailValid,
      isNameValid: isNameValid,
      isPasswordValid: isPasswordValid,
    );
    emit(newState);
    if (newState.isFormValid) {
      emit(RegisterState.loading());
      try {
        await _userRepos.signUp(event.email, event.password, event.name);
        emit(RegisterState.success());
      } catch (e) {
        emit(RegisterState.failure());
      }
    }
  }
}
