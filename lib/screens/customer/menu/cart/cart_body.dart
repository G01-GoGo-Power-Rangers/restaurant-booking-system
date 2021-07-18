import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/order_food_viewmodel.dart';

import '../cart_item_card.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderFoodViewModel _orderFoodViewModel =
        Provider.of<OrderFoodViewModel>(context);

    return _orderFoodViewModel.food.isEmpty
        ? Center(
            child: Text('Start order food now'),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: ListView.builder(
              itemCount: _orderFoodViewModel.food.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  onDismissed: (direction) {
                    _orderFoodViewModel.onDeleteFood(index);
                  },
                  key: UniqueKey(),
                  // key: Key(index.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red[300],
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  child: CartItemCard(food: _orderFoodViewModel.food[index]),
                ),
              ),
            ),
          );
  }
}
