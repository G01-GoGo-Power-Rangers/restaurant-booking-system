import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/booking_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/order_food_viewmodel.dart';

class OrderFoodBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookingViewModel _bookingViewModel = Provider.of<BookingViewModel>(context);
    OrderFoodViewModel _orderFoodViewModel =
        Provider.of<OrderFoodViewModel>(context);

    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: new Image.network(
                '${_orderFoodViewModel.selectedFood.foodphoto}',
                fit: BoxFit.fill,
              ),
            )
          ]),
          new Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 5),
            child: Card(
                elevation: 2,
                child: ListTile(
                    trailing: Text(
                      'RM ${_orderFoodViewModel.selectedFood.foodprice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      '${_orderFoodViewModel.selectedFood.foodname.toUpperCase()}',
                      style: TextStyle(fontSize: 20),
                    ))),
          ),
          new Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 0, left: 15.0, right: 15.0),
            child: new ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100.0,
              ),
              child: TextField(
                onChanged: (value) =>
                    _orderFoodViewModel.specialInstructions = value,
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                decoration:
                    InputDecoration(labelText: "Any special instructions"),
                minLines: 4,
                maxLines: null,
              ),
            ),
          ),
          new Container(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    _orderFoodViewModel.onTapMinus();
                  },
                  child: Material(
                    shape: Border.all(color: kPrimaryColor),
                    elevation: 5.0,
                    child: Icon(
                      Icons.remove,
                      size: 40.0,
                      color: kPrimaryColor,
                    ),
                  )),
              GestureDetector(
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: kPrimaryColor, width: 3.0),
                  )),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: TextFormField(
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        initialValue: '${_orderFoodViewModel.counterValue}',
                        onChanged: (value) {
                          _orderFoodViewModel.onChangedCounterValue(value);
                        },
                        key: ValueKey<int>(_orderFoodViewModel.counterValue),
                        style: TextStyle(color: kPrimaryColor, fontSize: 56.0),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    _orderFoodViewModel.onTapPlus();
                  },
                  child: Material(
                    shape: Border.all(color: kPrimaryColor),
                    elevation: 5.0,
                    child: Icon(
                      Icons.add,
                      size: 40.0,
                      color: kPrimaryColor,
                    ),
                  )),
            ],
          )),
          new Padding(padding: EdgeInsets.all(10)),
          new Center(
            child: Text(
              'TOTAL: RM ${(_orderFoodViewModel.counterValue.toDouble() * _orderFoodViewModel.selectedFood.foodprice).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          new Padding(padding: EdgeInsets.all(10)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColorDarker,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  minimumSize: Size(310.0, 35.0),
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                child: Text('ADD TO CART'),
                onPressed: () {
                  _orderFoodViewModel.createOrder(_bookingViewModel.booking);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green[600],
                      content: Text(
                        'Added to cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      )));
                },
              ),
              new Padding(padding: EdgeInsets.all(30)),
            ],
          )
        ]));
  }
}
