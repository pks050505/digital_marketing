part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {}

class LogOutEvent extends AuthenticationEvent {}

class AuthUserChanged extends AuthenticationEvent {
  final UserModel user;
  const AuthUserChanged(this.user);
  @override
  List<Object> get props => [user];
}
