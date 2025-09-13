class Endpoints {
  Endpoints._();

  static const _baseUrl = "http://10.20.1.87:8088/local-order-system-ms/api";

  static const products = "$_baseUrl/products";
  static const order = "$_baseUrl/orders/generate-qr";
  static String qr(int id) => "$_baseUrl/orders/$id/qr";
}
