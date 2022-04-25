part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;

  final FormSubmissionStatus status;
  bool get isValidEmail => email.contains('@');
  bool get isValidPassword => password.length > 6;
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = const InitialFormStatus(),
  });
  LoginState copywith({
    String? email,
    String? password,
    FormSubmissionStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

abstract class FormSubmissionStatus extends Equatable {
  const FormSubmissionStatus();
  @override
  List<Object?> get props => [];
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class FormSubmissionSuccess extends FormSubmissionStatus {}

class FormSubmissionFailed extends FormSubmissionStatus {
  final Exception exception;
  const FormSubmissionFailed(this.exception);
  @override
  List<Object?> get props => [exception];
}
