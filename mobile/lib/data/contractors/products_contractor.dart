import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';

abstract class ProductsContractor {
  Future<ProductsResponse> getProducts();
}
