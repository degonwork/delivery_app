class CartProductModel {
  final String? name, image, productId;
  final num? price;
  int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.productId,
  });
  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        name: json['name'],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
        "productId": productId,
      };
}
