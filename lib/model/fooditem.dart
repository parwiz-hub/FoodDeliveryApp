import 'package:meta/meta.dart';
FooditemList fooditemList = FooditemList(foodItem: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imagurl:
        "https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 11.99,
    imagurl:
        "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  FoodItem(
    id: 3,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imagurl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png?output-format=webp&fit=around|750:500&crop=750:500;*,*",
  ),
  FoodItem(
    id: 4,
    title: "Chilly Cheeze Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imagurl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/f95d4723da1cb9eb8d808d63dfb5350c.jpg?fit=around|750:500&crop=750:500;*,*",
  ),
  FoodItem(
    id: 5,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imagurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVGUcYQNRX-5FfCHa4_uh2jeRY7lGGjqf_fu7Ugz21upXMdhIJ3F6V069ZIiwFVhU2-7c&usqp=CAU",
  ),
  FoodItem(
    id: 6,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imagurl:
        "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
]);


class FooditemList {
  List<FoodItem> foodItem;
  FooditemList({required this.foodItem,});
}



class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imagurl;
  int quntity;
  FoodItem({
    required this.id,
    required this.title,
    required this.hotel,
    required this.price,
    required this.imagurl,
    this.quntity = 1,
  });
  void incrementQuntity() {
    this.quntity = this.quntity + 1;
  }

  void decrementQuntity() {
    this.quntity = this.quntity - 1;
  }
}
