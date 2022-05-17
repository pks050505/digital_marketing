part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  ready,
  failed,
  operationInProgress,
  success,
}

class LoginState extends Equatable {
  LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });

  // final FormzStatus status;
  // final Username username;
  // final Password password;
  final String email, password;
  final String message;
  final LoginStatus loginStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, loginStatus];
}
