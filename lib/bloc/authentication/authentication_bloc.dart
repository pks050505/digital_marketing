import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:digital_marketing/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;
  StreamSubscription<UserModel>? _userSubscription;
  AuthenticationBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthenticationInitial()) {
    _userSubscription =
        _authRepository.user.listen((user) => add(AuthUserChanged(user)));
    on<AppStartedEvent>(_appStarted);
    on<LogOutEvent>(_logOutEvent);
    on<AuthUserChanged>(_userChangedEvent);
  }

  FutureOr<void> _appStarted(
    AppStartedEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      bool isAuthenticated = await _authRepository.isAuthenticated();
      if (isAuthenticated) {
        // emit(AuthenticatedState());
      } else {
        emit(UnAuthenticatedState());
      }
    } catch (e) {
      emit(UnAuthenticatedState());
    }
  }

  FutureOr<void> _logOutEvent(
      LogOutEvent event, Emitter<AuthenticationState> emit) async {
    try {
      _authRepository.logOut();
      emit(UnAuthenticatedState());
    } catch (e) {}
  }

  FutureOr<void> _userChangedEvent(
    AuthUserChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    if (event is AuthUserChanged) {
      emit(AuthenticatedState(event.user));
    }
  }

  @override
  Future<void> close() {
    _userSubscription!.cancel();
    return super.close();
  }
}
