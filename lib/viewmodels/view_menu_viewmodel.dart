import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/dependencies.dart';
import 'package:restaurant_booking_system/models/food.dart';
import 'package:restaurant_booking_system/services/food_service.dart';

class ViewMenuViewModel extends ChangeNotifier {
  final FoodService foodservice = service();

  List<String> categories = ["Breakfast", "Lunch", "Dinner"];
  List<Food> foodList;
  List<Food> foodListFiltered;
  int selectedIndex = 0;

  chooseCategory(int index) {
    selectedIndex = index;
    getFoodListFiltered();
  }

  getFoodList() async {
    foodList = await foodservice.getFoodList();
    getFoodListFiltered();
    // print(foodList[0].foodname);
  }

  getFoodListFiltered() {
    foodListFiltered = [...foodList];

    if (selectedIndex == categories.indexOf('Breakfast')) {
      foodListFiltered.removeWhere((food) => food.foodcategory != 'breakfast');
    } else if (selectedIndex == categories.indexOf('Lunch')) {
      foodListFiltered.removeWhere((food) => food.foodcategory != 'lunch');
    } else {
      foodListFiltered.removeWhere((food) => food.foodcategory != 'dinner');
    }
    notifyListeners();
  }
}
