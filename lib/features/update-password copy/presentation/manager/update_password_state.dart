sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {}

final class UpdatePasswordError extends UpdatePasswordState {}
