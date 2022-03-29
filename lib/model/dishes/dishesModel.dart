// To parse this JSON data, do
//
//     final popularDishes = popularDishesFromJson(jsonString);

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

  final String status;
  final List<Datum> data;

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
    required this.restaurantId,
    required this.restaurantName,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productSellingPrice,
    required this.productStatus,
    required this.productQuantity,
    required this.productRating,
    required this.productRatingCount,
    required this.productSellCount,
  });

  final int productId;
  final int restaurantId;
  final String restaurantName;
  final String productName;
  final String productDescription;
  final String productImage;
  final String productSellingPrice;
  final String productStatus;
  final String productQuantity;
  final dynamic productRating;
  final dynamic productRatingCount;
  final dynamic productSellCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productImage: json["product_image"],
        productSellingPrice: json["product_selling_price"],
        productStatus: json["product_status"],
        productQuantity: json["product_quantity"],
        productRating: json["product_rating"],
        productRatingCount: json["product_rating_count"],
        productSellCount: json["product_sell_count"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "product_name": productName,
        "product_description": productDescription,
        "product_image": productImage,
        "product_selling_price": productSellingPrice,
        "product_status": productStatus,
        "product_quantity": productQuantity,
        "product_rating": productRating,
        "product_rating_count": productRatingCount,
        "product_sell_count": productSellCount,
      };
}
