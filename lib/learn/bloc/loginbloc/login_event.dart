import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvents {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvents {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class Submitted extends LoginEvents {
  final String email;
  final String password;
  const Submitted(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}
