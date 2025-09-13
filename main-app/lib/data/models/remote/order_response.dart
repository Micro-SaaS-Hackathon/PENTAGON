class OrderResponse {
  final int? id;
  final dynamic tableNo;
  final DateTime? orderDate;
  final String? status;
  final int? totalAmount;
  final String? qrPath;
  final List<ProductElement>? products;

  OrderResponse({
    this.id,
    this.tableNo,
    this.orderDate,
    this.status,
    this.totalAmount,
    this.qrPath,
    this.products,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    id: json["id"],
    tableNo: json["tableNo"],
    orderDate:
        json["orderDate"] == null ? null : DateTime.parse(json["orderDate"]),
    status: json["status"],
    totalAmount: json["totalAmount"],
    qrPath: json["qrPath"],
    products:
        json["products"] == null
            ? []
            : List<ProductElement>.from(
              json["products"]!.map((x) => ProductElement.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tableNo": tableNo,
    "orderDate": orderDate?.toIso8601String(),
    "status": status,
    "totalAmount": totalAmount,
    "qrPath": qrPath,
    "products":
        products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class ProductElement {
  final ProductProduct? product;
  final int? quantity;

  ProductElement({this.product, this.quantity});

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    product:
        json["product"] == null
            ? null
            : ProductProduct.fromJson(json["product"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
  };
}

class ProductProduct {
  final int? id;
  final String? productImage;
  final String? name;
  final String? shortDescription;
  final double? price;

  ProductProduct({
    this.id,
    this.productImage,
    this.name,
    this.shortDescription,
    this.price,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
    id: json["id"],
    productImage: json["productImage"],
    name: json["name"],
    shortDescription: json["shortDescription"],
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
