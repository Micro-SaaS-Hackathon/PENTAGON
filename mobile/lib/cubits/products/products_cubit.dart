import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_saas/data/contractors/products_contractor.dart';
import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._contract) : super(ProductsInitial());

  final ProductsContractor _contract;

  Future<void> getProducts() async {
    try {
      emit(ProductsLoading());
      log("products loading");

      final response = await _contract.getProducts();
      emit(ProductsSuccess(response));
      log("product success");
    } on DioException catch (e, s) {
      emit(ProductsNetworkError(e.toString()));
      log("Products dio exception: $e, \nstack: $s");
    }
  }
}
