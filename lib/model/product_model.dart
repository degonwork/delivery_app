import 'package:flutter/material.dart';
import 'package:flutter_firebase/helper/extenstion.dart';

class ProductModel {
  final String? name, image, decription, size, id;
  final num? price;
  final Color? color;

  ProductModel({
    required this.name,
    required this.image,
    required this.decription,
    required this.color,
    required this.size,
    required this.price,
    required this.id,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'],
      image: json["image"],
      decription: json["decription"],
      color: HexColor.fromHex(json["color"]),
      size: json["size"],
      price: json["price"],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "decription": decription,
        "color": color,
        "size": size,
        "price": price,
        "id": id,
      };
}
