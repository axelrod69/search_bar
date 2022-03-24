import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/dishes/dishesProvider.dart';
import './model/restaurants/restaurantsProvider.dart';

class Search extends StatefulWidget {
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final _controller = TextEditingController();
  bool value = true;
  bool isLoading = true;
  String query = '';
  List<dynamic> search = [];
  PopularDishesProvider popular = PopularDishesProvider();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDishesProvider>(context, listen: false)
        .searchData('')
        .then((_) {
      setState(() {
        isLoading = false;
        search = Provider.of<PopularDishesProvider>(context, listen: false)
            .searchResult;
      });
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   Provider.of<PopularDishesProvider>(context).searchData(query);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final dishProvider =
        Provider.of<PopularDishesProvider>(context).popularDishes;
    final restaurantProvider =
        Provider.of<PopularRestaurantProvider>(context).restaurants;
    final provider = Provider.of<PopularDishesProvider>(context).searchDish;
    final searchProvider =
        Provider.of<PopularDishesProvider>(context).searchResult;

    PopularDishesProvider popular = PopularDishesProvider();
    print(query);
    print(search);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundColor: Colors.green,
          titleSpacing: 0,
          toolbarHeight: 100,
          title: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 14,
                      width: double.infinity,
                      // color: Colors.red,
                      child: const Text(
                        'Delivering To',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text(
                              'Address',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    // color: Colors.red,
                    padding: const EdgeInsets.only(top: 8, left: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.grey,
                        ),
                        // if (_searchIcon)
                        Expanded(
                          child: Center(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 6, right: 4),
                              padding: const EdgeInsets.only(left: 6),
                              // height: double.infinity,
                              height: 45,
                              width: width * 0.7,
                              decoration: BoxDecoration(
                                  // color: Colors.transparent,
                                  // color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
                              child: Row(
                                children: [
                                  Flexible(
                                      flex: 9,
                                      fit: FlexFit.tight,
                                      child: Center(
                                        child: TextField(
                                          controller: _controller,
                                          onChanged: (value) async {
                                            setState(() {
                                              query = value;
                                            });
                                            // Provider.of<PopularDishesProvider>(
                                            //         context,
                                            //         listen: false)
                                            //     .searchData(value.toString());
                                            await popular.searchData(value);
                                            // print(query);
                                          },
                                          autofocus: true,
                                          cursorColor: Colors.grey,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Search By Restaurant or Food',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            // suffixIcon: Icon(
                                            //   Icons.send,
                                            //   color: Colors.grey,
                                            //   size: 20,
                                            // )
                                          ),
                                        ),
                                      )),
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: const Icon(Icons.close,
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: width * 0.01),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed('/cart-screen'),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.grey,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: width * 0.06,
                    top: height * 0.02,
                    child: const CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '9+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Positioned(
                    right: width * 0.001,
                    top: height * 0.02,
                    child: const CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '9+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Restaurants',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Switch.adaptive(
                      thumbColor: value
                          ? MaterialStateProperty.all(Colors.red)
                          : MaterialStateProperty.all(Colors.amber),
                      trackColor: value
                          ? MaterialStateProperty.all(
                              Color.fromRGBO(255, 194, 168, 1))
                          : MaterialStateProperty.all(
                              const Color.fromRGBO(255, 250, 168, 1)),
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      }),
                ),
                Text(
                  'Food',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: value
                      ? Container(
                          width: double.infinity,
                          color: Colors.red,
                          child: ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                                title: Text(search[index]['product_name'])),
                            // dishProvider['data'][index]['product_name']),
                            // provider[index]['product_name'])),
                            // itemCount: dishProvider["data"].length,
                            itemCount: search.length,
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Text(restaurantProvider['data']['data']
                                  [index]['restaurant_name']),
                            ),
                            itemCount:
                                restaurantProvider["data"]["data"].length,
                          ),
                        ))
        ],
      ),
    );
  }
}
