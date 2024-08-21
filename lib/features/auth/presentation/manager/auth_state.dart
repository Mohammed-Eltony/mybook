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

// headers state
class HeadersLoading extends AuthState {}

class HeadersSuccess extends AuthState {}

class HeadersError extends AuthState {
  String error;

  HeadersError(this.error);
}

// bast seller state
class BastSellerLoading extends AuthState {}

class BastSellerSuccess extends AuthState {}

class BastSellerError extends AuthState {
  String error;

  BastSellerError(this.error);
}

// category state
class CategoryLoading extends AuthState {}

class CategorySuccess extends AuthState {}

class CategoryError extends AuthState {
  String error;

  CategoryError(this.error);
}

// profile state
class ProfileLoading extends AuthState {}

class ProfileSuccess extends AuthState {}

class ProfileError extends AuthState {
  String error;

  ProfileError(this.error);
}

//edit profile state
class EditProfileLoading extends AuthState {}

class EditProfileSuccess extends AuthState {}

class EditProfileError extends AuthState {
  String error;

  EditProfileError(this.error);
}

// search state
class SearchLoading extends AuthState {}

class SearchSuccess extends AuthState {}

class SearchError extends AuthState {
  String error;

  SearchError(this.error);
}

// get Show Category state
class ShowCategoryLoading extends AuthState {}

class ShowCategorySuccess extends AuthState {}

class ShowCategoryError extends AuthState {
  String error;

  ShowCategoryError(this.error);
}
