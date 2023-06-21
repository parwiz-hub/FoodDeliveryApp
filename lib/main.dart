import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/cartListBloc.dart';
import 'bloc/listColorStyle.dart';
import 'mywidget.dart';
import '../model/fooditem.dart';
import '../bloc/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // can recovery bloc in your widget whit help of BlocProvider
    return BlocProvider(
      blocs: [
        // bloc i return cartListBloc()
      Bloc((i) => CartListBloc()),
      Bloc(
        // return ColorBloc
        (i)=>ColorBloc()
      )
      ],
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
              // return every food item and pass food ithem to ItemContainer
              for (var foodItem in fooditemList.foodItems)
                ItemContainer(foodItem: foodItem),
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
            width: 40,
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
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  // if clic item ass to cart
    addTocart(FoodItem foodItem) {
      bloc.addToList(foodItem);
      // use snak nar for print this text
      final snackBar = SnackBar(
        content: Text("${foodItem.title} add to List"),
        duration: Duration(milliseconds: 550),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return GestureDetector(
      onTap: () {
        addTocart(foodItem);
      },
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
    double containerPading = 45;
    double contanerBorderRadius = 10;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: LeftAligned ? 0 : containerPading,
            right: LeftAligned ? containerPading : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: LeftAligned
                        ? Radius.circular(0)
                        : Radius.circular(contanerBorderRadius),
                    right: LeftAligned
                        ? Radius.circular(contanerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.network(
                    imagurl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: LeftAligned ? 20 : 0,
                  right: LeftAligned ? 0 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          '\$$itemPrice',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(text: "by "),
                            TextSpan(
                              text: hotel,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: containerPading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
