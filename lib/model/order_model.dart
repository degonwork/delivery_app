import 'package:flutter_firebase/model/cart_product_model.dart';

class OrderModel {
  final String userId, dateTime;
  final Address address;
  final List<CartProductModel> products;

  OrderModel({
    required this.userId,
    required this.dateTime,
    required this.address,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        userId: json['userId'],
        dateTime: json["dateTime"],
        address: json["address"],
        products: json["products"],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        "dateTime": dateTime,
        "address": address,
        "products": products,
      };
}

class Address {
  final String street1, street2, city, state, country;

  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street1: json['street1'],
        street2: json["street2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "street1": street1,
        "street2": street2,
        "city": city,
        "state": state,
        "country": country,
      };
}
