import '../model/fooditem.dart';
import 'package:flutter/material.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<FoodItem> foodItems = [];

  List<FoodItem> addToList(FoodItem foodItem) {
    bool isPresent = false;
    // for increse  item selected towice add id
    if (foodItems.length > 0) {
      for (int i = 0; i < foodItems.length; i++) {
        if (foodItems[i].id == foodItem.id) {
          incresItemQuntity(foodItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }
      if (!isPresent) {
        foodItems.add(foodItem);
      }
    } else {
      foodItems.add(foodItem);
    }
    return foodItems;
  }

  void incresItemQuntity(FoodItem foodItem) => foodItem.incrementQuntity();
  void decresItemQuntity(FoodItem foodItem) => foodItem.decrementQuntity();

  List<FoodItem> removeFromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }
}
