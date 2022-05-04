import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class NameChanged extends RegisterEvent {
  final String name;
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String name;
  const Submitted(
      {required this.email, required this.name, required this.password});
  @override
  List<Object?> get props => [email, name, password];
}
