import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/models/food.dart';
import 'package:restaurant_booking_system/viewmodels/menu_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/order_food_viewmodel.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard({this.food});
  @override
  Widget build(BuildContext context) {
    MenuViewModel _menuViewModel = Provider.of<MenuViewModel>(context);
    OrderFoodViewModel _orderFoodViewModel =
        Provider.of<OrderFoodViewModel>(context);

    return InkWell(
      onTap: () {
        if (_menuViewModel.isOrdering) {
          _orderFoodViewModel.selectedFood = food;
          Navigator.pushNamed(context, '/orderfood');
        } else
          return null;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: 140,
            // width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 2),
              ],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.0, color: Colors.transparent),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                '${food.thumbnail}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              food.foodname,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            'RM ${food.foodprice.toDouble().toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
