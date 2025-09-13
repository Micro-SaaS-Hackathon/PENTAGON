import 'package:pizza_mizza_qr_code_scanner/data/contractor/take_order_contractor.dart';
import 'package:pizza_mizza_qr_code_scanner/data/services/take_order_service.dart';

class TakeOrderRepository implements TakeOrderContractor {
  TakeOrderRepository(this._takeOrderService);

  final TakeOrderService _takeOrderService;
  @override
  Future<bool> takeOrder({required int tabelId}) {
    return _takeOrderService.takeOrder(tabelId: tabelId);
  }
}
