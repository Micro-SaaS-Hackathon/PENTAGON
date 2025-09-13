import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(const BasketInitial());

  void addProductToBasket(ProductsResponse product) {
    final updatedProductsWithCount = Map<ProductsResponse, int>.from(state.productsWithCount);
    
    // Increment count if product already exists, otherwise add it
    updatedProductsWithCount.update(product, (value) => value + 1, ifAbsent: () => 1);
    
    // Recalculate total item count and total price
    int newTotalItemCount = 0;
    double newTotalPrice = 0.0;
    
    updatedProductsWithCount.forEach((key, value) {
      newTotalItemCount += value;
      newTotalPrice += key.price! * value;
    });

    emit(BasketUpdated(
      productsWithCount: updatedProductsWithCount,
      totalItemCount: newTotalItemCount,
      totalPrice: newTotalPrice,
    ));
  }
}