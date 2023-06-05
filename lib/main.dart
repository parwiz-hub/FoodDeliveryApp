import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/cartListBloc.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=>CartListBloc())
      ],
      child:  MaterialApp(
      title: 'Food Delivery',
      home: Scaffold(),
      debugShowCheckedModeBanner: false,
     
    ),
    );
  }
}



