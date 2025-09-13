import 'package:pizza_mizza_saas/data/contractors/products_contractor.dart';
import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';
import 'package:pizza_mizza_saas/data/services/remote/products_service.dart';

class ProductsRepository implements ProductsContractor {
  ProductsRepository(this._productsService);

  final ProductsService _productsService;

  @override
  Future<List<ProductsResponse>> getProducts() {
    return _productsService.getProducts();
  }
}
