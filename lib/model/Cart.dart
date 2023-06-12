import 'package:flutter/cupertino.dart';

import '../bloc/cartListBloc.dart';
import 'package:flutter/material.dart';
import 'fooditem.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<FoodItem> foodItems;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data!;
          return Scaffold(
            body: SafeArea(
              child: CartBody(
                foodItems,
              ),
            ),
          );
        } else {
          return Container(
            child: Text("Something returned null"),
          );
        }
      },
    );
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? fooditemList() : noitemcontainer(),
          )
        ],
      ),
    );
  }

  ListView fooditemList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (builder, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }

  Container noitemcontainer() {
    return Container(
      child: Center(
        child: Text(
          "No more item left in the cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "my",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              Text(
                "Order",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 35,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              //for go back
              Navigator.pop(context);
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              CupertinoIcons.delete,
              size: 35,
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: itemcontent(foodItem: foodItem),
    );
  }
}

class itemcontent extends StatelessWidget {
  final FoodItem foodItem;
  itemcontent({required this.foodItem});

  get borderRadius => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // create selected iamge icon
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              foodItem.imagurl,
              fit: BoxFit.fitHeight,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                children: [
                  // quntity(number of seolected)
                  TextSpan(text: foodItem.quntity.toString()),
                  TextSpan(text: 'x'),
                  TextSpan(text: foodItem.title),
                ]),
          ),
          Text(
            '\$${foodItem.quntity * foodItem.price}',
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
