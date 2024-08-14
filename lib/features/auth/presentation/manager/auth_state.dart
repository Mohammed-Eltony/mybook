sealed class AuthState {}

final class AuthInitial extends AuthState {}

// login state
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  String error;

  LoginError(this.error);
}

// register state
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  String error;

  RegisterError(this.error);
}

// forgot password state
class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {}

class ForgotPasswordError extends AuthState {
  String error;

  ForgotPasswordError(this.error);
}

// reset password state
class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  String error;

  ResetPasswordError(this.error);
}
