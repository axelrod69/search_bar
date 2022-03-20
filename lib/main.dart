import 'package:flutter/material.dart';
import './search.dart';
import 'package:provider/provider.dart';
import './model/dishes/dishesProvider.dart';
import './model/restaurants/restaurantsProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopularDishesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PopularRestaurantProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Search(),
      ),
    );
  }
}
