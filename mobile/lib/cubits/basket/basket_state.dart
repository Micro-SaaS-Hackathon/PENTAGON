part of 'basket_cubit.dart';

@immutable
abstract class BasketState {
  // Use a map to store products and their counts
  final Map<ProductsResponse, int> productsWithCount;
  final int totalItemCount;
  final double totalPrice;

  const BasketState({
    this.productsWithCount = const {},
    this.totalItemCount = 0,
    this.totalPrice = 0.0,
  });
}

class BasketInitial extends BasketState {
  const BasketInitial({
    super.productsWithCount,
    super.totalItemCount,
    super.totalPrice,
  });
}

class BasketUpdated extends BasketState {
  const BasketUpdated({
    required super.productsWithCount,
    required super.totalItemCount,
    required super.totalPrice,
  });
}
