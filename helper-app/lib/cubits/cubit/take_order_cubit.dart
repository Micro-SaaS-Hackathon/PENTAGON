import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_qr_code_scanner/data/contractor/take_order_contractor.dart';
part 'take_order_state.dart';

class TakeOrderCubit extends Cubit<TakeOrderState> {
  TakeOrderCubit(this._contractor) : super(TakeOrderInitial());

  // final int tableId = 1;
  final TakeOrderContractor _contractor;

  Future<void> takeOrder(int tableId) async {
    try {
      emit(TakeOrderLoading());
      log("Take order loading");

      final response = await _contractor.takeOrder(tabelId: tableId);
      emit(TakeOrderSuccess());
      log("order success");

    } on DioException catch (e, s) {
      emit(TakeOrderNetworkError(e.toString()));
      log("dio exception, $e, \n stacktrace: $s");
    } catch (e, s) {
      emit(TakeOrderError(e.toString()));
      log("unkown exception, $e, \n stacktrace: $s");
    }
  }
}
