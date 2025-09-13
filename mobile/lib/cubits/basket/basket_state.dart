part of 'basket_cubit.dart';

@immutable
abstract class BasketState {
  final List<ProductsResponse> products;
  final int totalCount;

  const BasketState({
    this.products = const [],
    this.totalCount = 0,
  });
}

class BasketInitial extends BasketState {
  const BasketInitial({super.products, super.totalCount});
}

class BasketUpdated extends BasketState {
  const BasketUpdated({required super.products, required super.totalCount});
}
