import 'package:flutter/material.dart';
import './dishesModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PopularDishesProvider with ChangeNotifier {
  Map<String, dynamic> _popularDishes = {};
  Map<String, dynamic> _dishes = {};
  List<dynamic> _searchDish = [];
  List<dynamic> _searchResult = [];
  Map<String, dynamic> _favouriteDishes = {};
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  final bool _favourite = false;

  bool get favourite {
    return _favourite;
  }

  Map<String, dynamic> get popularDishes {
    return {..._popularDishes};
  }

  List<dynamic> get searchDish {
    return [..._searchDish];
  }

  List<dynamic> get searchResult {
    return [..._searchResult];
  }

  Map<String, dynamic> get favouriteDishes {
    return {..._favouriteDishes};
  }

  Future<void> fetchData() async {
    final url = Uri.parse(baseUrl + 'api/all_products');
    final response = await http.get(url);
    // print(response.body);
    PopularDishes popularDishes = popularDishesFromJson(response.body);
    _popularDishes = popularDishes.toJson();
    // print('Popular Dishes $_popularDishes');
  }

  Future<void> searchData() async {
    final url = Uri.parse(baseUrl + 'api/all_products');
    final response = await http.get(url);
    PopularDishes popularDishes = popularDishesFromJson(response.body);
    _dishes = popularDishes.toJson();
    // _searchDish
    //     .add(_popularDishes['data'].map((value) => value['product_name']));
    // print('Dishes Data ${_dishes['data']}');
    _dishes['data'].forEach((value) => _searchDish.add(value));
    // _searchResult = _searchDish.where((element) {
    //   final name = element['product_name'].toLowerCase();
    //   final searchQuery = query.toLowerCase();
    //   return name.contains(searchQuery);
    // }).toList();
    // _searchDish.add(_searchDish.where((element) {
    //   final name = element['product_name'].toLowerCase();
    //   final searchQuery = query.toLowerCase();
    //   return name.contains(searchQuery);
    // }));
    // _searchDish
    //     .forEach((value) => _searchResult.add(_searchDish.where((element) {
    //           final name = element['product_name'].toLowerCase();
    //           final searchQuery = query.toLowerCase();
    //           return name.contains(searchQuery);
    //         })));
    print(_searchDish);
    notifyListeners();
    // print('Search Dish $_searchResult');
    // print(_searchResult);
  }

  Future<void> fetchFavouriteData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.getString('token');
    final url = Uri.parse(baseUrl + 'api/auth/wishlist');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });

    PopularDishes favouriteDishes = popularDishesFromJson(response.body);
    _favouriteDishes = favouriteDishes.toJson();
  }

  Future<void> postFavouriteData(String productId, String restaurantId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/wishlist');
    final response = await http.post(url, body: {
      'product_id': productId,
      'restaurant_id': restaurantId
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
  }

  Future<void> deleteFavouriteData(String productId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/auth/wishlist/$productId');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Accept': 'application/json'
    });
  }
  // void markAsFavourite(String productId) {
  //   _popularDishes
  // }
}

// import 'package:flutter/material.dart';
// import './popular_dishes_model.dart';

// class PopularDishesProvider with ChangeNotifier {
//   final Map<String, dynamic> _popularDishes = {
//     "data": [
//       {
//         "id": "1",
//         "name": "Chicken Tandoor Combo",
//         "restaurantName": "Tandoori House",
//         "price": "455",
//         "rating": "4.3",
//         "totalRatings": "154",
//         "image": "assets/images/Rectangle 17323.png",
//         "isFavourite": false
//       },
//       {
//         "id": "2",
//         "name": "Pan Cake",
//         "restaurantName": "The Pancake Centre",
//         "price": "250",
//         "rating": "4.7",
//         "totalRatings": "256",
//         "image": "assets/images/Rectangle 17324.png",
//         "isFavourite": false
//       },
//       {
//         "id": "3",
//         "name": "Salad",
//         "restaurantName": "The Pancake House",
//         "price": "180",
//         "rating": "4.1",
//         "totalRatings": "203",
//         "image": "assets/images/Rectangle 17325.png",
//         "isFavourite": false
//       },
//       {
//         "id": "4",
//         "name": "Roast Chicken",
//         "restaurantName": "Kentucky\"s Fried Chicken",
//         "price": "550",
//         "rating": "4.8",
//         "totalRatings": "1000",
//         "image": "assets/images/Rectangle 17323 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "5",
//         "name": "Ice Cream",
//         "restaurantName": "Naturals",
//         "price": "80",
//         "rating": "5.0",
//         "totalRatings": "1500",
//         "image": "assets/images/Rectangle 17324 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "6",
//         "name": "Chicken Tandoor Combo",
//         "restaurantName": "Tandoori House",
//         "price": "455",
//         "rating": "4.3",
//         "totalRatings": "154",
//         "image": "assets/images/Rectangle 17323.png",
//         "isFavourite": false
//       },
//       {
//         "id": "7",
//         "name": "Pan Cake",
//         "restaurantName": "The Pancake Centre",
//         "price": "250",
//         "rating": "4.7",
//         "totalRatings": "256",
//         "image": "assets/images/Rectangle 17324.png",
//         "isFavourite": false
//       },
//       {
//         "id": "8",
//         "name": "Salad",
//         "restaurantName": "The Pancake House",
//         "price": "180",
//         "rating": "4.1",
//         "totalRatings": "203",
//         "image": "assets/images/Rectangle 17325.png",
//         "isFavourite": false
//       },
//       {
//         "id": "9",
//         "name": "Roast Chicken",
//         "restaurantName": "Kentucky\"s Fried Chicken",
//         "price": "550",
//         "rating": "4.8",
//         "totalRatings": "1000",
//         "image": "assets/images/Rectangle 17323 (2).png",
//         "isFavourite": false
//       },
//       {
//         "id": "10",
//         "name": "Ice Cream",
//         "restaurantName": "Naturals",
//         "price": "80",
//         "rating": "5.0",
//         "totalRatings": "1500",
//         "image": "assets/images/Rectangle 17324 (2).png",
//         "isFavourite": false
//       }
//     ]
//   };

//   Map<String, dynamic> get popularDishes {
//     return {..._popularDishes};
//   }

//   List<Map<String, dynamic>> getProductById(String id) {
//     //The filter method that I've tried to write that yields the error
//     return _popularDishes["data"].where((value) => value["id"] == id).toList();
//   }

//   // void fetchData() {
//   //   final Map<String, dynamic> data = popularDishesFromJson(_popularDishes.toString()) as Map<String, dynamic>;
//   // }
// }
