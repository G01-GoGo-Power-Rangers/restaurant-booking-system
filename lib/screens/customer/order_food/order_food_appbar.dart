import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/order_food_viewmodel.dart';

class OrderFoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderFoodAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    OrderFoodViewModel _orderFoodViewModel =
        Provider.of<OrderFoodViewModel>(context);

    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: InkWell(
        onTap: () {
          _orderFoodViewModel.counterValue = 1;
          _orderFoodViewModel.specialInstructions = '';
          _orderFoodViewModel.selectedFood = null;
          Navigator.pop(context);
        },
        child: Container(
          child: Icon(
            Icons.close_rounded,
            color: Colors.white70,
          ),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
        ),
      ),
    );
  }
}
