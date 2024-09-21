sealed class OrderHistoeyState {}

final class OrderHistoeyInitial extends OrderHistoeyState {}

final class OrderHistoeyLoading extends OrderHistoeyState {}

final class OrderHistoeySuccess extends OrderHistoeyState {}

final class OrderHistoeyError extends OrderHistoeyState {}


final class SingelOrderLoading extends OrderHistoeyState {}

final class SingelOrderSuccess extends OrderHistoeyState {}

final class SingelOrderError extends OrderHistoeyState {}