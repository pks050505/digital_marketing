part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

//for splace screen
class AuthenticationInitial extends AuthenticationState {}

//for home page
class AuthenticatedState extends AuthenticationState {
  final UserModel user;
  const AuthenticatedState(this.user);
}

// For Login Page
class UnAuthenticatedState extends AuthenticationState {}
