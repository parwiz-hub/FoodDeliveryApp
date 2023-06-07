import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/cartListBloc.dart';
import 'mywidget.dart';
import '../model/fooditem.dart';
import '../bloc/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => CartListBloc())],
      dependencies: const [],
      child: MaterialApp(
        title: 'Food Delivery',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(
                height: 45,
              ),
              for (var foodItem in fooditemList.foodItems)
                ItemContainer(foodItem: foodItem)
            ],
          ),
        ),
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CoustomAppBar(),
          SizedBox(
            width: 30,
          ),
          title(),
          SizedBox(
            width: 30,
          ),
          searchBar(),
          SizedBox(
            width: 30,
          ),
          category(),
        ],
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;
  ItemContainer({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imagurl: foodItem.imagurl,
        LeftAligned: (foodItem.id % 2 == 0) ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    required this.LeftAligned,
    required this.imagurl,
    required this.itemName,
    required this.itemPrice,
    required this.hotel,
  });
  final bool LeftAligned;
  final String imagurl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
