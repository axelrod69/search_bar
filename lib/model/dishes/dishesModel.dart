// To parse this JSON data, do
//
//     final PopularDishes = PopularDishesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PopularDishes popularDishesFromJson(String str) =>
    PopularDishes.fromJson(json.decode(str));

String popularDishesToJson(PopularDishes data) => json.encode(data.toJson());

class PopularDishes {
  PopularDishes({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory PopularDishes.fromJson(Map<String, dynamic> json) => PopularDishes(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.productId,
    required this.restaurantName,
    required this.restaurantId,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productSellingPrice,
  });

  int productId;
  String restaurantName;
  String restaurantId;
  String productName;
  String productDescription;
  String productImage;
  String productSellingPrice;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        restaurantName: json["restaurant_name"],
        restaurantId: json["restaurant_id"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productImage: json["product_image"],
        productSellingPrice: json["product_selling_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "restaurant_name": restaurantName,
        "restaurant_id": restaurantId,
        "product_name": productName,
        "product_description": productDescription,
        "product_image": productImage,
        "product_selling_price": productSellingPrice,
      };
}
