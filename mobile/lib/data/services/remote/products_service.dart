import 'package:pizza_mizza_saas/data/models/remote/products_response.dart';
import 'package:pizza_mizza_saas/utils/constants/endpoints.dart';
import 'package:pizza_mizza_saas/utils/dio/client_dion.dart';
import 'package:pizza_mizza_saas/utils/extensions/status_code_extension.dart';

class ProductsService {
  final endpoint = Endpoints.products;

  Future<List<ProductsResponse>> getProducts() async {
    final response = await clientDio.get(endpoint);

    if (response.statusCode.isSuccess) {
      List<dynamic> data = response.data;
      
      return data.map((e) => ProductsResponse.fromJson(e)).toList() ;
    } else if (response.statusCode.isFailure) {
      throw Exception("Failed to load PRODUCTS data in service");
    }
    throw Exception("Unable to load PRODUCTS data in service");
  }
}
