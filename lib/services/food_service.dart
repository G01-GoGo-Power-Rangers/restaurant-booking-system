import 'package:flutter/material.dart';

import '../dependencies.dart';
import 'rest.dart';
import '../models/food.dart';

class FoodService {
  final restService = service<Rest>();

  Future<List<Food>> getFoodList() async {
    final List jsonList = await restService.get('foods');
    if (jsonList == null) return null;
    return jsonList.map((json) => Food.fromJson(json)).toList();
  }

  Future<Food> getFoodByFoodid(String foodid) async {
    final json = await restService.get('foods/food/$foodid');
    if (json == null) return null;
    return Food.fromJson(json);
  }
}
