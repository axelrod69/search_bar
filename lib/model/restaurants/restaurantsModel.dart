// To parse this JSON data, do
//
//     final PopularRestaurants = PopularRestaurantsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PopularRestaurants popularRestaurantsFromJson(String str) =>
    PopularRestaurants.fromJson(json.decode(str));

String popularRestaurantsToJson(PopularRestaurants data) =>
    json.encode(data.toJson());

class PopularRestaurants {
  PopularRestaurants({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory PopularRestaurants.fromJson(Map<String, dynamic> json) =>
      PopularRestaurants(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantImage,
    required this.restaurantRating,
    required this.restaurantRatingCount,
    required this.distance,
  });

  int restaurantId;
  String restaurantName;
  String restaurantAddress;
  String restaurantImage;
  dynamic restaurantRating;
  dynamic restaurantRatingCount;
  double distance;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        restaurantAddress: json["restaurant_address"],
        restaurantImage: json["restaurant_image"],
        restaurantRating: json["restaurant_rating"],
        restaurantRatingCount: json["restaurant_rating_count"],
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_address": restaurantAddress,
        "restaurant_image": restaurantImage,
        "restaurant_rating": restaurantRating,
        "restaurant_rating_count": restaurantRatingCount,
        "distance": distance,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
