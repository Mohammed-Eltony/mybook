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

// show Favorite state
class ShowFavoriteLoading extends AuthState {}

class ShowFavoriteSuccess extends AuthState {}

class ShowFavoriteError extends AuthState {
  String error;

  ShowFavoriteError(this.error);
}

// add Favorite state
class AddFavoriteLoading extends AuthState {}

class AddFavoriteSuccess extends AuthState {}

class AddFavoriteError extends AuthState {
  String error;

  AddFavoriteError(this.error);
}

// remove Favorite state
class RemoveFavoriteLoading extends AuthState {}

class RemoveFavoriteSuccess extends AuthState {}

class RemoveFavoriteError extends AuthState {
  String error;

  RemoveFavoriteError(this.error);
}

// add cart state

class AddCartLoading extends AuthState {}

class AddCartSuccess extends AuthState {}

class AddCartError extends AuthState {
  String error;

  AddCartError(this.error);
}
// logout state

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  String error;

  LogoutError(this.error);
}

// delete account state

class DeleteAccountLoading extends AuthState {}

class DeleteAccountSuccess extends AuthState {}

class DeleteAccountError extends AuthState {
  String error;

  DeleteAccountError(this.error);
}
