import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './restaurantsModel.dart';

class PopularRestaurantProvider with ChangeNotifier {
  String baseUrl = 'https://achievexsolutions.in/current_work/eatiano/';
  Map<String, dynamic> _restaurants = {};
  Map<String, dynamic> _searchRestaurants = {};
  final queryParams = {'lat': '22.5735314', 'lng': '88.4331189'};

  Map<String, dynamic> get restaurants {
    return {..._restaurants};
  }

  Map<String, dynamic> get searchRestaurants {
    return {..._searchRestaurants};
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
