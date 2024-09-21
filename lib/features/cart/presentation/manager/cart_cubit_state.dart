sealed class CartState {}

final class CartCubitInitial extends CartState {}

final class CartCubitLoading extends CartState {}

final class CartCubitSuccess extends CartState {}

final class CartCubitError extends CartState {
  final String error;
  CartCubitError(this.error);
}

final class CheckoutLoading extends CartState {}

final class CheckoutSuccess extends CartState {}

final class CheckoutError extends CartState {
  final String error;
  CheckoutError(this.error);
}
