import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/models/food.dart';
import 'package:restaurant_booking_system/models/order.dart';
import 'package:restaurant_booking_system/services/order_service.dart';

import '../dependencies.dart';

class OrderFoodViewModel extends ChangeNotifier {
  String _specialInstructions = "";
  int _counterValue = 1;
  Food _selectedFood = Food();
  Booking _booking = Booking();
  Order _order = Order();
  List<dynamic> _food = [];
  dynamic _aFood = {};
  dynamic _totalPrice = 0;

  final orderService = service<OrderService>();

  String get specialInstructions => _specialInstructions;
  set specialInstructions(value) => _specialInstructions = value;
  int get counterValue => _counterValue;
  set counterValue(value) => _counterValue = value;
  Food get selectedFood => _selectedFood;
  set selectedFood(value) => _selectedFood = value;
  Booking get booking => _booking;
  set booking(value) => _booking = value;
  Order get order => _order;
  set order(value) => _order = value;
  List<dynamic> get food => _food;
  set food(value) => _food = value;
  get totalPrice => _totalPrice;

  set totalPrice(value) => _totalPrice = value;

  createOrder(Booking booking) {
    setOrderFood();
    calcTotalPrice();
    setUserOrder(booking);
  }

  onClickCheckOut(BuildContext context) async {
    final result = await orderService.createnewOrder(order);
    if (result == null)
      print('Failed');
    else
      Navigator.pushNamed(context, '/ordersuccess');
  }

  setUserOrder(Booking booking) {
    order.bookingid = booking.id;
    order.foods = food;
    order.totalPrice = totalPrice;
    print(order.bookingid);
    print(order.foods);
    print(order.totalPrice);
  }

  setOrderFood() {
    _aFood = {
      'name': _selectedFood.foodname,
      'quantity': counterValue,
      'price': _selectedFood.foodprice,
      'instruction': specialInstructions
    };
    _food.add(_aFood);
    _aFood = null;
  }

  calcTotalPrice() {
    totalPrice = 0;
    food.forEach((food) {
      totalPrice += food['price'] * food['quantity'];
    });
  }

  onDeleteFood(int index) async {
    food.removeAt(index);
    calcTotalPrice();
    notifyListeners();
  }

  onTapMinus() {
    counterValue -= 1;
    notifyListeners();
  }

  onTapPlus() {
    counterValue += 1;
    notifyListeners();
  }

  onChangedCounterValue(value) {
    counterValue = int.parse(value);
  }
}
