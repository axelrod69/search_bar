import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './restaurantsModel.dart';

class PopularRestaurantProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _restaurants = {};
  Map<String, dynamic> _searchRestaurants = {};
  List<dynamic> _restaurantList = [];
  final queryParams = {'lat': '22.5735314', 'lng': '88.4331189'};

  Map<String, dynamic> get restaurants {
    return {..._restaurants};
  }

  Map<String, dynamic> get searchRestaurants {
    return {..._searchRestaurants};
  }

  List<dynamic> get restaurantList {
    return [..._restaurantList];
  }

  Future<void> fetchRestaurants() async {
    // final url = Uri.https('achievexsolutions.in/current_work/eatiano/',
    //     'api/all_restaurant', queryParams);
    final url = Uri.parse(baseUrl +
        'api/all_restaurant' +
        '?' +
        'lat=${queryParams['lat']}' +
        '&' +
        'lng=${queryParams['lng']}');
    final response = await http.get(url);
    // print(response.body);
    PopularRestaurants popularRestaurants =
        popularRestaurantsFromJson(response.body);
    _restaurants = popularRestaurants.toJson();
    // _restaurants['data']['data']
    //     .forEach((key, value) => _restaurantList.add(value));
    _restaurants['data'].map((value) =>
        value['data'].forEach((value) => _restaurantList.add(value)));
    print('Restaurants List $_restaurantList');
    // print('Restaurants $_restaurants');
  }

  // Future<void> searchRestaurants(String query) async {
  //   final url = Uri.parse(baseUrl +
  //       'api/all_restaurant' +
  //       '?' +
  //       'lat=${queryParams['lat']}' +
  //       '&' +
  //       'lng=${queryParams['lng']}');
  //   final response = await http.get(url);
  //   PopularRestaurants popularRestaurants =
  //       popularRestaurantsFromJson(response.body);
  //   _searchRestaurants = popularRestaurants
  //       .toJson()
  //       .map((key, value) => value.where((value) {
  //         return value['data']['data'][]
  //       }));
  // }
}
