import '../model/fooditem.dart';
import 'package:flutter/material.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<FoodItem> foodItems = [];

  List<FoodItem> addToList(FoodItem foodItem) {
    foodItems.add(foodItem);
    return foodItems;
  }
  List<FoodItem> removeFromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }
}
