import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/cartListBloc.dart';
import 'mywidget.dart';

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
          SizedBox(width: 30,),
          category(),
        ],
      ),
    );
  }
}
