import 'dart:async';

import 'package:digital_marketing/learn/bloc/auth_bloc/auth_event.dart';
import 'package:digital_marketing/learn/bloc/auth_bloc/auth_state.dart';
import 'package:digital_marketing/learn/user_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepos _userRepos;
  AuthBloc({required UserRepos userRepos})
      : _userRepos = userRepos,
        super(UnInitialize()) {
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
  }

  FutureOr<void> _appStarted(AppStarted event, Emitter<AuthState> emit) async {
    try {
      var isSignedIn = await _userRepos.isSignedIn();
      //for splace screen
      Future.delayed(const Duration(seconds: 2));
      if (isSignedIn) {
        var user = await _userRepos.getUser();
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _loggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(Authenticated(await _userRepos.getUser()));
  }

  FutureOr<void> _loggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    emit(UnAuthenticated());
    _userRepos.signOut();
  }
}
