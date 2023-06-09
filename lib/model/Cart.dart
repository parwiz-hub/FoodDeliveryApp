import 'package:flutter/cupertino.dart';
import '../bloc/cartListBloc.dart';
import 'package:flutter/material.dart';
import '../bloc/listColorStyle.dart';
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
            bottomNavigationBar: BottomBar(foodItems),
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

class BottomBar extends StatelessWidget {
  final List<FoodItem> foodItems;
  BottomBar(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalamount(foodItems),
          Divider(
            height: 1,
            color: Colors.grey.shade700,
          ),
          persons(),
          NxtBumonBar(),
        ],
      ),
    );
  }

  Container NxtBumonBar() {
    return Container(
      margin: EdgeInsets.only(right: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFFfeb324),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '15-25 min',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
          Text(
            'Next',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Container persons() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Persons',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          costompersons(),
        ],
      ),
    );
  }

  Container totalamount(List<FoodItem> foodItem) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Total:',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            '\$${returnTotalAmount(foodItems)}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalamount = 0.0;
    for (int i = 0; i < foodItems.length; i++) {
      // listing total price
      totalamount = totalamount + foodItems[i].price * foodItems[i].quntity;
    }
    return totalamount.toStringAsFixed(2);
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
// if ithem exest show list ithem
  ListView fooditemList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (builder, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }
// if dont exest ithem prent this text
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
        DragTargetWidget(),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  final CartListBloc listBloc = BlocProvider.getBloc<CartListBloc>();
  final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
  @override
  Widget build(BuildContext context) {
    return DragTarget<FoodItem>(
      onWillAccept: (FoodItem) {
        colorBloc.setColor(Colors.red);
        return true;
      },
      onAccept: (FoodItem foodItem) {
        listBloc.removeFromList(foodItem);
        colorBloc.setColor(Colors.white);
      },
      onLeave: (FoodItem) {
        colorBloc.setColor(Colors.white);
      },
      builder: (context, incoming, rejected) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(
            CupertinoIcons.delete,
            size: 35,
          ),
        );
      },
    );
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    // this widgwt from bloc pcage use for dragg
    return Draggable(
      // this data conect whit dragibleWidget to specfic drag targit
      data: foodItem,
      maxSimultaneousDrags: 1,
      feedback: DragibleChildFedback(foodItem: foodItem),
      child: DragibleChild(foodItem: foodItem),
      childWhenDragging: foodItem.quntity > 1
          ? DragibleChild(foodItem: foodItem)
          : Container(),
    );
  }
}

class DragibleChild extends StatelessWidget {
  const DragibleChild({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: itemcontent(foodItem: foodItem),
    );
  }
}

class DragibleChildFedback extends StatelessWidget {
  const DragibleChildFedback({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
    return Opacity(
      opacity: 0.7,
      child: Material(
        child: StreamBuilder(
            stream: colorBloc.colorStream,
            builder: (context, snapshot) {
              return Container(
                margin: EdgeInsets.only(bottom: 25),
                child: itemcontent(foodItem: foodItem),
                decoration: BoxDecoration(
                  color: snapshot.data != null ? snapshot.data : Colors.white,
                ),
              );
            }),
      ),
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
                  // quntity(number of selected)
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

class costompersons extends StatefulWidget {
  State<costompersons> createState() => _costompersonsState();
}

class _costompersonsState extends State<costompersons> {
  int NumberOfPersons = 1;
  double _botomWidth = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _botomWidth,
            height: _botomWidth,
            child: ElevatedButton(
              child: Text(
                '-',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (NumberOfPersons > 1) {
                    NumberOfPersons--;
                  }
                });
              },
            ),
          ),
          Text(
            NumberOfPersons.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            width: _botomWidth,
            height: _botomWidth,
            child: ElevatedButton(
              child: Text(
                '+',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (NumberOfPersons > 1) {
                    NumberOfPersons++;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
