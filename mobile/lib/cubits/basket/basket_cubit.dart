import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(const BasketInitial());

  void addProductToBasket(ProductsResponse product) {
    final updatedProducts = List<ProductsResponse>.from(state.products)
      ..add(product);
    emit(
      BasketUpdated(
        products: updatedProducts,
        totalCount: updatedProducts.length,
      ),
    );
  }
}
