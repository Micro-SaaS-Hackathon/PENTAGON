part of 'take_order_cubit.dart';

sealed class TakeOrderState {}

final class TakeOrderInitial extends TakeOrderState {}

final class TakeOrderLoading extends TakeOrderState {}

final class TakeOrderSuccess extends TakeOrderState {}

final class TakeOrderError extends TakeOrderState {
  TakeOrderError(this.msg);
  final String msg;
}

final class TakeOrderNetworkError extends TakeOrderState {
  TakeOrderNetworkError(this.msg);
  final String msg;
}
