part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.response);

  final ProductsResponse response;
}

final class ProductsError extends ProductsState {
  ProductsError(this.message);

  final String message;
}

final class ProductsNetworkError extends ProductsState {
  ProductsNetworkError(this.message);

  final String message;
}
