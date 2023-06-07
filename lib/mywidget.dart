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

Widget category() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Pizza",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Rolls",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
      ],
    ),
  );
}

class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;
  CategoryListItem({
    required this.categoryIcon,
    required this.categoryName,
    required this.availability,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20,
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? Color(0xFFfeb324) : Colors.white,
          border: Border.all(
            color: selected ? Colors.transparent : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 15,
              offset: Offset(25, 0),
              spreadRadius: 5,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: selected ? Colors.transparent : Colors.grey,
                  width: 1.5,
                )),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
