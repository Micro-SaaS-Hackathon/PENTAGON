import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pizza_mizza_qr_code_scanner/utils/client_dio.dart';
import 'package:pizza_mizza_qr_code_scanner/utils/endpoints.dart';
import 'package:pizza_mizza_qr_code_scanner/utils/status_code_extension.dart';

class TakeOrderService {
  Future<bool> takeOrder({required int tabelId}) async {
    final endpoint = Endpoints.takeOrder;

    final requestBody = {"tableId": tabelId};
    log("request body: $requestBody");

    final response = await clientDio.post(endpoint, data: requestBody);
    log("take order response: $response");
    log("take order response status code: ${response.statusCode}");

    return response.statusCode.isSuccess;
  }
}
