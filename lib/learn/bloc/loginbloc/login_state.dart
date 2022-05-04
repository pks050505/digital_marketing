class LoginStates {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get isFormValid => isEmailValid && isPasswordValid;
  LoginStates({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isFailure,
    required this.isSuccess,
  });
  factory LoginStates.empty() {
    return LoginStates(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
    );
  }
  factory LoginStates.loading() {
    return LoginStates(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
    );
  }
  factory LoginStates.success() {
    return LoginStates(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: true,
    );
  }
  factory LoginStates.failure() {
    return LoginStates(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: true,
      isSuccess: false,
    );
  }
  LoginStates update({bool? isEmailValid, bool? isPasswordValid}) {
    return LoginStates(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting,
      isFailure: isFailure,
      isSuccess: isSuccess,
    );
  }

  LoginStates copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isFailure,
    bool? isSuccess,
  }) {
    return LoginStates(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
