import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/order_food_viewmodel.dart';

import '../../../../constant.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderFoodViewModel _orderFoodViewModel =
        Provider.of<OrderFoodViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // height: 110,
      // color: Colors.red,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 15,
              color: Colors.black.withOpacity(0.08),
            ),
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text.rich(
              TextSpan(text: 'Total:\n', children: [
                TextSpan(
                    text:
                        "RM ${_orderFoodViewModel.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20)),
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColorDarker,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  minimumSize: Size(230.0, 50.0),
                  textStyle: TextStyle(fontSize: 25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
              child: Text('Check Out'),
              onPressed: () {
                _orderFoodViewModel.onClickCheckOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
