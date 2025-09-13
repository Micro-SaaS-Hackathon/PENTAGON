class ProductsResponse {
  final int? id;
  final String? productImage;
  final String? name;
  final String? shortDescription;
  final double? price;

  ProductsResponse({
    this.id,
    this.productImage,
    this.name,
    this.shortDescription,
    this.price,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        id: json["id"],
        productImage: json["productImage"],
        name: json["name"],
        shortDescription: json["shortDescription"]!,
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productImage": productImage,
    "name": name,
    "shortDescription": shortDescription,
    "price": price,
  };
}
