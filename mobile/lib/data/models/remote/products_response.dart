class ProductsResponse {
  final int? id;
  final String? productImage;
  final String? name;
  final ShortDescription? shortDescription;
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
        shortDescription: shortDescriptionValues.map[json["shortDescription"]]!,
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productImage": productImage,
    "name": name,
    "shortDescription": shortDescriptionValues.reverse[shortDescription],
    "price": price,
  };
}

enum ShortDescription {
  AUTHENTIC_ITALIAN_STYLE,
  CRISPY_CRUST_WITH_GOOEY_CHEESE,
  DELICIOUS_CHEESY_PIZZA,
  FRESHLY_BAKED_WITH_PREMIUM_TOPPINGS,
  HOT_AND_FLAVORFUL,
  PERFECT_FOR_SHARING_WITH_FRIENDS,
}

final shortDescriptionValues = EnumValues({
  "Authentic Italian style.": ShortDescription.AUTHENTIC_ITALIAN_STYLE,
  "Crispy crust with gooey cheese.":
      ShortDescription.CRISPY_CRUST_WITH_GOOEY_CHEESE,
  "Delicious cheesy pizza.": ShortDescription.DELICIOUS_CHEESY_PIZZA,
  "Freshly baked with premium toppings.":
      ShortDescription.FRESHLY_BAKED_WITH_PREMIUM_TOPPINGS,
  "Hot and flavorful.": ShortDescription.HOT_AND_FLAVORFUL,
  "Perfect for sharing with friends.":
      ShortDescription.PERFECT_FOR_SHARING_WITH_FRIENDS,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
