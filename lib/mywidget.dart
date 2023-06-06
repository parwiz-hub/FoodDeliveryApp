import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text('0'),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        width: 45,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Food',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            'Delivery',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      )
    ],
  );
}
